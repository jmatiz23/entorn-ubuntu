#!/bin/bash

./tslabs-kernel.sh

./java-kernel.sh

./customize-jupyter.sh

./customize-lab-themes.sh

jupyter kernelspec list
