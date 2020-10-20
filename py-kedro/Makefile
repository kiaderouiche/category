# $NetBSD$

DISTNAME=	kedro-0.16.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/d6/7e/5dcd8fae474292fae388bcf40236e89dd58e1e37a04ab0f5aa2833a4b1c8/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/quantumblacklabs/kedro
COMMENT=	Kedro helps you build production-ready data and analytics pipelines
#LICENSE=	Apache Software License (Apache 2.0) # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: anyconfig~=0.9.7>=0
DEPENDS+=	# TODO: cachetools~=4.1>=0
DEPENDS+=	# TODO: click<8.0>=0
DEPENDS+=	py-cookiecutter>=1.6.0,<1.7.0#1.7.1releasepinnedpython-slugifytobe>=4.0.0,whichconflictswithairflowsubdependencyinKedro-airflow:../../devel/py-cookiecutter
DEPENDS+=	# TODO: fsspec>=0.5.1,<0.7.0#Thereisabreakingchangein0.7.0
DEPENDS+=	py-jmespath>=0.9.5,<1.0:../../textproc/py-jmespath
DEPENDS+=	py-jupyter_client>=5.1,<7.0:../../devel/py-jupyter_client
DEPENDS+=	# TODO: pip-tools~=5.0>=0
DEPENDS+=	# TODO: pluggy~=0.13.0>=0
DEPENDS+=	# TODO: python-json-logger~=0.1.9>=0
DEPENDS+=	# TODO: PyYAML>=4.2,<6.0
DEPENDS+=	py-setuptools>=38.0:../../devel/py-setuptools
DEPENDS+=	# TODO: toposort~=1.5#Needstobeatleast1.5tobeabletoraiseCircularDependencyError>=0
TEST_DEPENDS+=	# TODO: adlfs~=0.2.4>=0
TEST_DEPENDS+=	py-bandit>=1.6.2,<2.0:../../wip/py-bandit
TEST_DEPENDS+=	# TODO: behave==1.2.6>=0
TEST_DEPENDS+=	# TODO: biopython~=1.73>=0
TEST_DEPENDS+=	# TODO: black==v19.10.b0>=0
TEST_DEPENDS+=	# TODO: dask[complete]~=2.6>=0
TEST_DEPENDS+=	# TODO: flake8~=3.5>=0
TEST_DEPENDS+=	# TODO: gcsfs>=0.3.0,<0.7.0#gcsfs0.7.0requiresfsspec>=0.8.0,butwepinfsspec<0.7.0
TEST_DEPENDS+=	# TODO: geopandas>=0.6.0,<1.0
TEST_DEPENDS+=	# TODO: hdfs>=2.5.8,<3.0
TEST_DEPENDS+=	# TODO: holoviews~=1.13.0>=0
TEST_DEPENDS+=	# TODO: import-linter==1.0>=0
TEST_DEPENDS+=	# TODO: ipython~=7.0>=0
TEST_DEPENDS+=	py-joblib>=0.14:../../devel/py-joblib
TEST_DEPENDS+=	py-matplotlib>=3.0.3,<4.0:../../graphics/py-matplotlib
TEST_DEPENDS+=	py-memory_profiler>=0.50.0,<1.0:../../wip/py-memory_profiler
TEST_DEPENDS+=	# TODO: moto==1.3.7>=0
TEST_DEPENDS+=	# TODO: mypy<=1.0>=0
TEST_DEPENDS+=	py-nbconvert>=5.3.1,<6.0:../../www/py-nbconvert
TEST_DEPENDS+=	# TODO: nbformat~=4.4>=0
TEST_DEPENDS+=	# TODO: networkx~=2.4>=0
TEST_DEPENDS+=	py-openpyxl>=3.0.3,<4.0:../../textproc/py-openpyxl
TEST_DEPENDS+=	# TODO: pandas-gbq>=0.12.0,<1.0
TEST_DEPENDS+=	py-pandas>=0.24.0#Needstobeatleast0.24.0tomakeuseof`pandas.DataFrame.to_numpy`(recommendedalternativeto`pandas.DataFrame.values`):../../math/py-pandas
TEST_DEPENDS+=	# TODO: Pillow~=7.1.2>=0
TEST_DEPENDS+=	# TODO: pre-commit~=1.17>=0
TEST_DEPENDS+=	# TODO: psutil==5.6.6>=0
TEST_DEPENDS+=	# TODO: pyarrow>=0.12.0,<1.0.0
TEST_DEPENDS+=	py-pylint>=2.5.2,<3.0:../../devel/py-pylint
TEST_DEPENDS+=	# TODO: pyspark~=2.2;python_version<'3.8'>=0
TEST_DEPENDS+=	# TODO: pytest-cov~=2.5>=0
TEST_DEPENDS+=	# TODO: pytest-lazy-fixture~=0.6.3>=0
TEST_DEPENDS+=	# TODO: pytest-mock>=1.7.1,<2.0
TEST_DEPENDS+=	# TODO: pytest~=5.0>=0
TEST_DEPENDS+=	# TODO: requests-mock~=1.6>=0
TEST_DEPENDS+=	# TODO: requests~=2.20>=0
TEST_DEPENDS+=	# TODO: s3fs>=0.3.0,<0.4.1#Needstobeatleast0.3.0tomakeuseof`cachable`attributeonS3FileSystem.
TEST_DEPENDS+=	# TODO: SQLAlchemy~=1.2>=0
TEST_DEPENDS+=	# TODO: tables~=3.6>=0
TEST_DEPENDS+=	# TODO: tensorflow~=2.0>=0
TEST_DEPENDS+=	# TODO: trufflehog~=2.1>=0
TEST_DEPENDS+=	# TODO: wheel==0.32.2>=0
TEST_DEPENDS+=	# TODO: xlrd~=1.0>=0
TEST_DEPENDS+=	# TODO: xlsxwriter~=1.0>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
