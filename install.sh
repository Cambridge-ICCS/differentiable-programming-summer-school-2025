#!/bin/bash

# Create a Python virtual environment and pip install all requirements
python3 -m venv .venv
source .venv/bin/activate
echo "source $(pwd)/.venv/bin/activate" >>${HOME}/.bashrc
pip install .

# Install Tapenade and put it in the path
wget https://tapenade.gitlabpages.inria.fr/tapenade/distrib/tapenade_3.16.tar
tar xvf tapenade_3.16.tar
rm tapenade_3.16.tar
export PATH=${PWD}/tapenade_3.16/bin:${PATH}
echo "export PATH=${PWD}/tapenade_3.16/bin:${PATH}" >>${HOME}/.bashrc
