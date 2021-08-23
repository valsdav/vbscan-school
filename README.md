# Docker container for MadGraph and Tensorflow

[MadGraph](https://launchpad.net/mg5amcnlo) is a integrated event generator for the high energy phisics and
widely used in that field. This docker image significantly simplifies the process to use MadGraph.
The ROOT framework and common Python packages as numpy, pandas,Tensorflow etc have been also included in the image. 

This repository has been built on top of: https://github.com/scailfin/MadGraph5_aMC-NLO

## Prerequisite

You need to install docker first. Check [here](https://docs.docker.com/install/).

## Install

```bash
git clone https://github.com/valsdav/vbscan-school.git
```

## Usage and files sharing

A folder of your file system is shared between your system and the docker: it is mounted inside the docker in the **/data**
location.  Only the files created in the **/data** directory inside the docker are visibile in the user file system outside of the docker and are persisted when the docker is stopped. 

The folder to be mounted inside the docker is defined at the startup of the docker: repositories and data files should be placed inside that folder to make them visible inside the docker.

To open a session run:

```bash

export WORKSPACE=/home/user/path/to/your/workspace/of/preference
./run.sh $WORKSPACE

```

