#!/bin/bash

# Pip install all requirements
pip install .
pip install torch --index-url https://download.pytorch.org/whl/cpu

# Install Tapenade and put it in the path
wget https://tapenade.gitlabpages.inria.fr/tapenade/distrib/tapenade_3.16.tar
tar xvf tapenade_3.16.tar
rm tapenade_3.16.tar
export PATH=${PWD}/tapenade_3.16/bin:${PATH}
echo "export PATH=${PWD}/tapenade_3.16/bin:${PATH}" >>${HOME}/.bashrc

# Copy over Firedrake notebooks
cp -r /opt/firedrake/docs/notebooks session2/firedrake/
