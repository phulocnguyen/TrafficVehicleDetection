#!/usr/bin/env bash

CONFIG=$1
GPUS=$2
WORKDIR=$3

PORT=${PORT:-29500}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH
echo $PYTHONPATH
python -m torch.distributed.run --nproc_per_node=$GPUS --master_port=$PORT \
    $(dirname "$0")/train.py $CONFIG --launcher pytorch ${@:4} --work-dir $WORKDIR
