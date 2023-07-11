#!/usr/bin/env bash

docker run --rm --volume "$(pwd)/openobserve:/helm-docs" jnorwood/helm-docs:latest
cp openobserve/README.md .
