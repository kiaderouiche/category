#!/bin/sh
#

cd /usr/pkgsrc/wip
for pdir in py-gerrychain py-graphene-sqlalchemy py-graphene py-grip py-path-and-address py-postgresfixture py-selenium-base py-wasserplan py-zfec py-teamcity py-jose
do
    mv -v $pdir /usr/pkgsrc/category/DONE
done
