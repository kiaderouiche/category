# Copyright 2012-2014 Canonical Ltd.  This software is licensed under the
# GNU Affero General Public License version 3 (see the file LICENSE).

"""PostgreSQL cluster fixture."""

from __future__ import (
    absolute_import,
    print_function,
    unicode_literals,
    )

__metaclass__ = type
__all__ = [
    "ClusterFixture",
    ]

from postgresfixture.clusterfixture import ClusterFixture
