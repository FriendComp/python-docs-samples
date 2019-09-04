#!/bin/bash
x=100
PROJECT_ID="ctr-serverless-iot"
REGION="us-central1"
REGISTRY_ID="THOR-USA-PROD"

while [ $x -le 300 ]
do
  DEVICE_ID="env-sim-0"
  DEVICE_ID+=$(($x))
  echo "Creating $DEVICE_ID !"
  x=$(( $x + 1 ))
  gcloud iot devices create $DEVICE_ID \
  --region=$REGION \
  --registry=$REGISTRY_ID \
  --public-key path=rsa_public.pem,type=rsa-x509-pem
done
