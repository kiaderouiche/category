import setuptools
import sys

with open("README.md", "r") as fh:

    long_description = fh.read()

setuptools.setup(

     name='techdebt',
     version='0.1.1',
     scripts=['techdebt'+sys.version[0:3]] ,
     author="Laurent Cetinsoy",
     author_email="laurent.cetinsoy@gmail.com",
     description="A technical debt tracker package",
     long_description_content_type='text/markdown',
     long_description=long_description,


     url="https://github.com/lcetinsoy/tech-debt",
     packages=setuptools.find_packages(),
     classifiers=[
         "Programming Language :: Python :: 3",
         "License :: OSI Approved :: MIT License",
         "Operating System :: OS Independent",
     ],
     install_requires=['matplotlib', 'pandas'],

 )