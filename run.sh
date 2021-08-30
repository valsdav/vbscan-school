#!/bin/bash

set -e
set -u
set -o pipefail

image="valsdav/vbscan-school:1.1"

WORKDIR=$(realpath $1)
COMMAND=${2:-default}

if [[ ! -d "$WORKDIR" ]]
then
    echo "$WORKDIR not exists on your filesystem: please create it before running the script";
    exit 1;
fi


docker pull "${image}"

case $COMMAND in
  "start")
    docker run \
	-ti -d --rm\
    --user $(id -u):$(id -g) \
	-v "${WORKDIR}":"/data" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name vbscan \
	"${image}" ;
    ;;

 "clean")
      docker stop $(docker ps -aq);
    ;;

  "python")
     docker run \
	-ti --rm \
    --user $(id -u):$(id -g) \
	-v "${WORKDIR}":"/data" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name vbscan \
	"${image}" \
    "python";
    ;;

   "mg5_aMC")
      docker run \
	-ti --rm \
    --user $(id -u):$(id -g) \
	-v "${WORKDIR}":"/data" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name vbscan \
	"${image}" \
    "mg5_aMC";
    ;;

    "root")
      docker run \
	-ti --rm \
    --user $(id -u):$(id -g) \
	-v "${WORKDIR}":"/data" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name vbscan \
	"${image}" \
    "root";
    ;;

  *)
    docker run \
	-ti --rm \
    --user $(id -u):$(id -g) \
	-v "${WORKDIR}":"/data" \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    --name vbscan \
	"${image}"
    ;;

esac

