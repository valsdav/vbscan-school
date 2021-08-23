# Docker container for MadGraph and Tensorflow

[MadGraph](https://launchpad.net/mg5amcnlo) is a integrated event generator for the high energy phisics and
widely used in that field. This docker image significantly simplifies the process to use MadGraph.

This repository has been built on top of: https://github.com/scailfin/MadGraph5_aMC-NLO

## Prerequisite

You need to install docker first. Check [here](https://docs.docker.com/install/).

## Install

```bash

```

## Usage

This container uses model files in /var/UFO\_models and outputs in /var/MG\_outputs.

So you should indicate these folders like this:

```bash
docker run -t -i -v $HOME/models:/var/UFO_models -v $HOME/outputs:/var/MG_outputs hfukuda/madgraph
```

Note that the local path must be an absolute, not a relative one.

### Run madevent

To use madevent for a process named `PROC_NAME`, you can run

```bash
docker run -it --rm -v $HOME/outputs:/var/MG_outputs -w /var/MG_outputs/PROC_NAME hfukuda/madgraph bin/madevent
```

### Run as the current user

By default, the madgraph run as root. If you want to run it as the current user, add `--user=$(id -u):$(id -g)` like this:

```bash
docker run -t -i --user=$(id -u):$(id -g) -v $HOME/models:/var/UFO_models -v $HOME/outputs:/var/MG_outputs hfukuda/madgraph
```

Note that `$HOME/outputs` must exist beforehand. Otherwise madgraph doesn't work well due to the permission problem.
