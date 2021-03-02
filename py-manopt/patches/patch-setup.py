$NetBSD$

--- setup.py.orig	2020-01-23 14:41:30.000000000 +0000
+++ setup.py
@@ -14,25 +14,6 @@ def parse_requirements_file(filename):
 
 
 if __name__ == "__main__":
-    requirements = parse_requirements_file("requirements.txt")
-
-    install_requires = []
-    optional_dependencies = {}
-    for requirement in requirements:
-        # We manually separate out hard from optional dependencies.
-        if any((d in requirement for d in OPTIONAL_DEPENDENCIES)):
-            package = requirement.split(">")[0].split("=")[0]
-            optional_dependencies[package] = [requirement]
-        else:
-            install_requires.append(requirement)
-
-    dev_requirements = parse_requirements_file("dev-requirements.txt")
-    extras_require = {
-        "test": dev_requirements,
-        **optional_dependencies
-    }
-    extras_require["all"] = list(chain(*extras_require.values()))
-
     pymanopt = runpy.run_path(
         os.path.join(BASE_DIR, "pymanopt", "__init__.py"))
 
@@ -63,16 +44,6 @@ if __name__ == "__main__":
                   "automatic differentiation,machine learning,numpy,scipy,"
                   "theano,autograd,tensorflow"),
         packages=find_packages(exclude=["tests"]),
-        install_requires=install_requires,
-        extras_require=extras_require,
         long_description=long_description,
         long_description_content_type="text/markdown",
-        data_files=[
-            "CONTRIBUTING.md",
-            "CONTRIBUTORS",
-            "LICENSE",
-            "MAINTAINERS",
-            "README.md",
-            "VERSION"
-        ]
     )
