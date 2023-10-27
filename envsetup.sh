#!/bin/bash
# Check for Ubuntu22.04 and python3.10
os_version=$(grep "VERSION_ID" /etc/os-release | cut -d'=' -f2 | tr -d '"')
python_version=$(python3.10 -V 2>&1 | awk '{print $2}')

if [ "$os_version" != "22.04" ] || [[ ! "$python_version" == 3.10* ]]; then
    echo "Error: System requirements not met (ubuntu==22.04 and python==3.10)."
    echo "       You can use sophgo/tpuc_dev:v3.1 docker image."
    echo " hint: docker pull sophgo/tpuc_dev:v3.1"
    exit 1
fi

# set environment variable

export TPUC_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export PATH=${TPUC_ROOT}/bin:$PATH
export PATH=${TPUC_ROOT}/python/tools:$PATH
export PATH=${TPUC_ROOT}/python/utils:$PATH
export PATH=${TPUC_ROOT}/python/test:$PATH
export PATH=${TPUC_ROOT}/python/samples:$PATH
export PATH=${TPUC_ROOT}/customlayer/python:$PATH
export LD_LIBRARY_PATH=$TPUC_ROOT/lib:$LD_LIBRARY_PATH
export PYTHONPATH=${TPUC_ROOT}/python:$PYTHONPATH
export PYTHONPATH=/usr/local/python_packages/mlir_core:$PYTHONPATH
export PYTHONPATH=/usr/local/python_packages/:$PYTHONPATH
export PYTHONPATH=${TPUC_ROOT}/customlayer/python:$PYTHONPATH
export MODEL_ZOO_PATH=${TPUC_ROOT}/../model-zoo
export REGRESSION_PATH=${TPUC_ROOT}/regression
