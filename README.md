# Docker container for MadGraph and Tensorflow

[MadGraph](https://launchpad.net/mg5amcnlo) is a integrated event generator for the high energy phisics and
widely used in that field. This docker image significantly simplifies the process to use MadGraph.
The ROOT framework and common Python packages as numpy, pandas,Tensorflow etc have been also included in the image. 

This repository has been built on top of: https://github.com/scailfin/MadGraph5_aMC-NLO

## Prerequisite

You need to install **docker** first. Please  checkout detailed instructions for Linux/Mac/Windows [here](https://docs.docker.com/install/) before going further with the instructions.

## Install

To install the relevant helper scripts to run the docker images just clone the repository on your system.

```bash
git clone https://github.com/valsdav/vbscan-school.git
```

## Usage and files sharing

A folder will be shared between your system and the docker processes in order to provide inputs and save the outputs. 

The folder to be mounted inside the docker is defined at the startup: repositories and data files should be placed inside that folder to make them visible inside the docker.

The folder is available inside the docker in the  **/data** path.  N.B.: only files saved in the **/data** directory inside the docker are visibile outside of the docker and are **persisted when the docker is stopped**.  Any other file created outside **/data** are not saved when the docker is stopped.

An helper script **run.sh** has been created to help with the download and startup of the programs inside the docker image. 

To open a session follow the instructions:

```bash

# Define the folder on your file system to be used for file sharing
export WORKSPACE=/home/user/path/to/your/workspace/of/preference
mkdir $WORKSPACE

# Install (if not already done) the helper script repository
git clone https://github.com/valsdav/vbscan-school.git
cd vbscan-school

# run.sh is a script to setup and run the docker enviroment
./run.sh $WORKSPACE 

```

Some options are available in the run.sh script to start directly python/root/Madgraph:

```bash 

# Open a bash session
./run.sh $WORKSPACE 

# Open a python session
./run.sh $WORKSPACE python

# Open a Madgraph session
./run.sh $WORKSPACE mg5_aMC

# Open a ROOT session
./run.sh $WORKSPACE root
```

It is also possible to just start the docker in the background and then open and run several terminal on the same running docker environment:

```bash
# Open a session in background
./run.sh $WORKSPACE start

# Now to open a terminal just run
docker exec -ti vbscan bash

# or to open a specific program
docker exec -ti vbscan python

# or to open a specific program
docker exec -ti vbscan "python /data/your-script.py"
```

To stop the docker process and all the programs inside just execute:

```bash
docker stop vbscan
docker rmr vbscan

#or use the helper program
./run.sh $WORKSPACE clean
```


## Sharing the X server

In order to be able to open the Root or Python graphical interfaces the X server of the machine needs to be shared with the docker. 
The necessary options have been added to the run.sh scripts. 

In case of problems this command has to be executed in the user machine: 

```bash
xhost local:
```

If the **xhost** command is not available please install the xorg-xhost package on your system.