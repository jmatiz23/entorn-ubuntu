#!/bin/bash

cd kernels/

./tslabs-kernel.sh

./java-kernel.sh

./customize-jupyter.sh

./customize-lab-themes.sh

cd ..

#jupyter kernelspec list
