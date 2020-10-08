$NetBSD$

--- setup.py.orig	2020-06-19 19:46:13.000000000 +0000
+++ setup.py
@@ -3,9 +3,6 @@ import setuptools
 with open("README.rst", 'r') as f:
     long_description = f.read()
 
-with open("requirements.txt", 'r') as f:
-    install_requires = f.readlines()
-
 setuptools.setup(
     name='selenium-generator',
     version='0.3',
@@ -17,7 +14,6 @@ setuptools.setup(
     author_email='jjaros587@gmail.com',
     packages=setuptools.find_packages(include=['selenium_generator', 'selenium_generator.*']),
     package_data={'selenium_generator': ['../test_runner/template/*.html', '../validators/schemas/*.json']},
-    install_requires=install_requires,
     python_requires='>=3.2',
     platforms='any',
     tests_require=["unittest"],
