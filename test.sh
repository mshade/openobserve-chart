#!/usr/bin/env bash

CT_IMAGE=quay.io/helmpack/chart-testing:v3.7.1

docker run -it --network host --workdir=/data --volume ~/.kube/config:/root/.kube/config:ro --volume $PWD:/data $CT_IMAGE \
    ct lint --charts openobserve
