# $NetBSD$

DISTNAME=	docker-cron-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/bf/55/92ff53b17e02a1240aace13ec9f20c20388628a27ee3a1247b57e9d5cbc2/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://bitbucket.org/genee/docker-cron
COMMENT=	An automated service importing scheduled jobs from /etc/cron.d in running docker containers
LICENSE=	mit

DEPENDS+=	py-docker>=3:../../category/py-docker
DEPENDS+=	# TODO: apscheduler>=3
DEPENDS+=	# TODO: python-crontab>=2

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
