#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

NAME="${1:-hubot-slack}"
TYPE="${2:-f1-micro}"

export CLOUDSDK_COMPUTE_ZONE="us-central1-b"
export CLOUDSDK_CORE_PROJECT="jscaduto-dev"

gcloud compute instances create "${NAME}" \
  --boot-disk-size "30GB" \
  --image-family=coreos-stable \
  --image-project=coreos-cloud \
  --machine-type "${TYPE}" \
  --metadata-from-file user-data=cloud-config.yml
