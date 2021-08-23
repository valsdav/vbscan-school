#!/bin/bash

set -e
set -u
set -o pipefail

image="valsdav/vbscan-school:1.0"

WORKDIR=$(realpath $1)

if [[ ! -d "$WORKDIR" ]]
then
    echo "$WORKDIR not exists on your filesystem: creating it"
    mkdir $WORKDIR;
fi

docker pull "${image}"
docker run \
	-ti --rm \
	-v "${WORKDIR}":"/data" \
	"${image}" 

