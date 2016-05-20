#!/bin/sh


. activate /opt/conda/envs/python2
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.9-src.zip
exec jupyter notebook
