# Copyright (C) 2019-2020  The Software Heritage developers
# See the AUTHORS file at the top-level directory of this distribution
# License: GNU General Public License version 3, or any later version
# See top-level LICENSE file for more information

import base64
from functools import partial
import os
import re
from typing import Mapping

from django.test.utils import setup_databases  # type: ignore
from django.urls import reverse
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import pytest
from rest_framework import status
from rest_framework.test import APIClient
import yaml

from swh.core.config import read
from swh.core.pytest_plugin import get_response_cb
from swh.deposit.config import (
    COL_IRI,
    DEPOSIT_STATUS_DEPOSITED,
    DEPOSIT_STATUS_LOAD_FAILURE,
    DEPOSIT_STATUS_LOAD_SUCCESS,
    DEPOSIT_STATUS_PARTIAL,
    DEPOSIT_STATUS_REJECTED,
    DEPOSIT_STATUS_VERIFIED,
    EDIT_SE_IRI,
    setup_django_for,
)
from swh.deposit.parsers import parse_xml
from swh.deposit.tests.common import create_arborescence_archive
from swh.model.identifiers import DIRECTORY, REVISION, SNAPSHOT, swhid
from swh.scheduler import get_scheduler

# mypy is asked to ignore the import statement above because setup_databases
# is not part of the d.t.utils.__all__ variable.


TEST_USER = {
    "username": "test",
    "password": "password",
    "email": "test@example.org",
    "provider_url": "https://hal-test.archives-ouvertes.fr/",
    "domain": "archives-ouvertes.fr/",
    "collection": {"name": "test"},
}


def pytest_configure():
    setup_django_for("testing")


@pytest.fixture
def requests_mock_datadir(datadir, requests_mock_datadir):
    """Override default behavior to deal with put/post methods

    """
    cb = partial(get_response_cb, datadir=datadir)
    requests_mock_datadir.put(re.compile("https://"), body=cb)
    requests_mock_datadir.post(re.compile("https://"), body=cb)
    return requests_mock_datadir


@pytest.fixture()
def deposit_config(swh_scheduler_config, swh_storage_backend_config):
    return {
        "max_upload_size": 500,
        "extraction_dir": "/tmp/swh-deposit/test/extraction-dir",
        "checks": False,
        "scheduler": {"cls": "local", **swh_scheduler_config,},
        "storage_metadata": swh_storage_backend_config,
    }


@pytest.fixture()
def deposit_config_path(tmp_path, monkeypatch, deposit_config):
    conf_path = os.path.join(tmp_path, "deposit.yml")
    with open(conf_path, "w") as f:
        f.write(yaml.dump(deposit_config))
    monkeypatch.setenv("SWH_CONFIG_FILENAME", conf_path)
    return conf_path


@pytest.fixture(autouse=True)
def deposit_autoconfig(deposit_config_path):
    """Enforce config for deposit classes inherited from APIConfig."""
    cfg = read(deposit_config_path)

    if "scheduler" in cfg:
        # scheduler setup: require the check-deposit and load-deposit tasks
        scheduler = get_scheduler(**cfg["scheduler"])
        task_types = [
            {
                "type": "check-deposit",
                "backend_name": "swh.deposit.loader.tasks.ChecksDepositTsk",
                "description": "Check deposit metadata/archive before loading",
                "num_retries": 3,
            },
            {
                "type": "load-deposit",
                "backend_name": "swh.loader.package.deposit.tasks.LoadDeposit",
                "description": "Loading deposit archive into swh archive",
                "num_retries": 3,
            },
        ]
        for task_type in task_types:
            scheduler.create_task_type(task_type)


@pytest.fixture(scope="session")
def django_db_setup(request, django_db_blocker, postgresql_proc):
    from django.conf import settings

    settings.DATABASES["default"].update(
        {
            ("ENGINE", "django.db.backends.postgresql"),
            ("NAME", "tests"),
            ("USER", postgresql_proc.user),  # noqa
            ("HOST", postgresql_proc.host),  # noqa
            ("PORT", postgresql_proc.port),  # noqa
        }
    )
    with django_db_blocker.unblock():
        setup_databases(
            verbosity=request.config.option.verbose, interactive=False, keepdb=False
        )


def execute_sql(sql):
    """Execute sql to postgres db"""
    with psycopg2.connect(database="postgres") as conn:
        conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cur = conn.cursor()
        cur.execute(sql)


@pytest.fixture(autouse=True, scope="session")
def swh_proxy():
    """Automatically inject this fixture in all tests to ensure no outside
       connection takes place.

    """
    os.environ["http_proxy"] = "http://localhost:999"
    os.environ["https_proxy"] = "http://localhost:999"


def create_deposit_collection(collection_name: str):
    """Create a deposit collection with name collection_name

    """
    from swh.deposit.models import DepositCollection

    try:
        collection = DepositCollection._default_manager.get(name=collection_name)
    except DepositCollection.DoesNotExist:
        collection = DepositCollection(name=collection_name)
        collection.save()
    return collection


def deposit_collection_factory(collection_name=TEST_USER["collection"]["name"]):
    @pytest.fixture
    def _deposit_collection(db, collection_name=collection_name):
        return create_deposit_collection(collection_name)

    return _deposit_collection


deposit_collection = deposit_collection_factory()
deposit_another_collection = deposit_collection_factory("another-collection")


@pytest.fixture
def deposit_user(db, deposit_collection):
    """Create/Return the test_user "test"

    """
    from swh.deposit.models import DepositClient

    try:
        user = DepositClient._default_manager.get(username=TEST_USER["username"])
    except DepositClient.DoesNotExist:
        user = DepositClient._default_manager.create_user(
            username=TEST_USER["username"],
            email=TEST_USER["email"],
            password=TEST_USER["password"],
            provider_url=TEST_USER["provider_url"],
            domain=TEST_USER["domain"],
        )
        user.collections = [deposit_collection.id]
        user.save()
    return user


@pytest.fixture
def client():
    """Override pytest-django one which does not work for djangorestframework.

    """
    return APIClient()  # <- drf's client


@pytest.fixture
def authenticated_client(client, deposit_user):
    """Returned a logged client

    This also patched the client instance to keep a reference on the associated
    deposit_user.

    """
    _token = "%s:%s" % (deposit_user.username, TEST_USER["password"])
    token = base64.b64encode(_token.encode("utf-8"))
    authorization = "Basic %s" % token.decode("utf-8")
    client.credentials(HTTP_AUTHORIZATION=authorization)
    client.deposit_client = deposit_user
    yield client
    client.logout()


@pytest.fixture
def sample_archive(tmp_path):
    """Returns a sample archive

    """
    tmp_path = str(tmp_path)  # pytest version limitation in previous version
    archive = create_arborescence_archive(
        tmp_path, "archive1", "file1", b"some content in file"
    )

    return archive


@pytest.fixture
def atom_dataset(datadir) -> Mapping[str, str]:
    """Compute the paths to atom files.

    Returns:
        Dict of atom name per content (bytes)

    """
    atom_path = os.path.join(datadir, "atom")
    data = {}
    for filename in os.listdir(atom_path):
        filepath = os.path.join(atom_path, filename)
        with open(filepath, "rb") as f:
            raw_content = f.read().decode("utf-8")

        # Keep the filename without extension
        atom_name = filename.split(".")[0]
        data[atom_name] = raw_content

    return data


def create_deposit(
    authenticated_client,
    collection_name: str,
    sample_archive,
    external_id: str,
    deposit_status=DEPOSIT_STATUS_DEPOSITED,
):
    """Create a skeleton shell deposit

    """
    url = reverse(COL_IRI, args=[collection_name])
    # when
    response = authenticated_client.post(
        url,
        content_type="application/zip",  # as zip
        data=sample_archive["data"],
        # + headers
        CONTENT_LENGTH=sample_archive["length"],
        HTTP_SLUG=external_id,
        HTTP_CONTENT_MD5=sample_archive["md5sum"],
        HTTP_PACKAGING="http://purl.org/net/sword/package/SimpleZip",
        HTTP_IN_PROGRESS="false",
        HTTP_CONTENT_DISPOSITION="attachment; filename=%s" % (sample_archive["name"]),
    )

    # then
    assert response.status_code == status.HTTP_201_CREATED
    from swh.deposit.models import Deposit

    deposit = Deposit._default_manager.get(external_id=external_id)

    if deposit.status != deposit_status:
        deposit.status = deposit_status
        deposit.save()
    assert deposit.status == deposit_status
    return deposit


def create_binary_deposit(
    authenticated_client,
    collection_name: str,
    sample_archive,
    external_id: str,
    deposit_status: str = DEPOSIT_STATUS_DEPOSITED,
    atom_dataset: Mapping[str, bytes] = {},
):
    """Create a deposit with both metadata and archive set. Then alters its status
       to `deposit_status`.

    """
    deposit = create_deposit(
        authenticated_client,
        collection_name,
        sample_archive,
        external_id=external_id,
        deposit_status=DEPOSIT_STATUS_PARTIAL,
    )

    response = authenticated_client.post(
        reverse(EDIT_SE_IRI, args=[collection_name, deposit.id]),
        content_type="application/atom+xml;type=entry",
        data=atom_dataset["entry-data0"] % deposit.external_id.encode("utf-8"),
        HTTP_SLUG=deposit.external_id,
        HTTP_IN_PROGRESS="true",
    )

    assert response.status_code == status.HTTP_201_CREATED
    assert deposit.status == DEPOSIT_STATUS_PARTIAL

    from swh.deposit.models import Deposit

    deposit = Deposit._default_manager.get(pk=deposit.id)
    if deposit.status != deposit_status:
        deposit.status = deposit_status
        deposit.save()

    assert deposit.status == deposit_status
    return deposit


def deposit_factory(deposit_status=DEPOSIT_STATUS_DEPOSITED):
    """Build deposit with a specific status

    """

    @pytest.fixture()
    def _deposit(
        sample_archive,
        deposit_collection,
        authenticated_client,
        deposit_status=deposit_status,
    ):
        external_id = "external-id-%s" % deposit_status
        return create_deposit(
            authenticated_client,
            deposit_collection.name,
            sample_archive,
            external_id=external_id,
            deposit_status=deposit_status,
        )

    return _deposit


deposited_deposit = deposit_factory()
rejected_deposit = deposit_factory(deposit_status=DEPOSIT_STATUS_REJECTED)
partial_deposit = deposit_factory(deposit_status=DEPOSIT_STATUS_PARTIAL)
verified_deposit = deposit_factory(deposit_status=DEPOSIT_STATUS_VERIFIED)
completed_deposit = deposit_factory(deposit_status=DEPOSIT_STATUS_LOAD_SUCCESS)
failed_deposit = deposit_factory(deposit_status=DEPOSIT_STATUS_LOAD_FAILURE)


@pytest.fixture
def partial_deposit_with_metadata(
    sample_archive, deposit_collection, authenticated_client, atom_dataset
):
    """Returns deposit with archive and metadata provided, status 'partial'

    """
    return create_binary_deposit(
        authenticated_client,
        deposit_collection.name,
        sample_archive,
        external_id="external-id-partial",
        deposit_status=DEPOSIT_STATUS_PARTIAL,
        atom_dataset=atom_dataset,
    )


@pytest.fixture
def partial_deposit_only_metadata(
    deposit_collection, authenticated_client, atom_dataset
):

    response = authenticated_client.post(
        reverse(COL_IRI, args=[deposit_collection.name]),
        content_type="application/atom+xml;type=entry",
        data=atom_dataset["entry-data1"],
        HTTP_SLUG="external-id-partial",
        HTTP_IN_PROGRESS=True,
    )

    assert response.status_code == status.HTTP_201_CREATED

    response_content = parse_xml(response.content)
    deposit_id = response_content["deposit_id"]
    from swh.deposit.models import Deposit

    deposit = Deposit._default_manager.get(pk=deposit_id)
    assert deposit.status == DEPOSIT_STATUS_PARTIAL
    return deposit


@pytest.fixture
def complete_deposit(sample_archive, deposit_collection, authenticated_client):
    """Returns a completed deposit (load success)

    """
    deposit = create_deposit(
        authenticated_client,
        deposit_collection.name,
        sample_archive,
        external_id="external-id-complete",
        deposit_status=DEPOSIT_STATUS_LOAD_SUCCESS,
    )
    origin = "https://hal.archives-ouvertes.fr/hal-01727745"
    directory_id = "42a13fc721c8716ff695d0d62fc851d641f3a12b"
    revision_id = "548b3c0a2bb43e1fca191e24b5803ff6b3bc7c10"
    snapshot_id = "e5e82d064a9c3df7464223042e0c55d72ccff7f0"
    deposit.swhid = swhid(DIRECTORY, directory_id)
    deposit.swhid_context = swhid(
        DIRECTORY,
        directory_id,
        metadata={
            "origin": origin,
            "visit": swhid(SNAPSHOT, snapshot_id),
            "anchor": swhid(REVISION, revision_id),
            "path": "/",
        },
    )
    deposit.save()
    return deposit


@pytest.fixture()
def tmp_path(tmp_path):
    return str(tmp_path)  # issue with oldstable's pytest version
