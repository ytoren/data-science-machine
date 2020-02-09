#!/bin/bash 
pkg update

pkg install root-repo
pkg install unstable-repo
pkg install x11-repo

# Pointless Repo
curl -LO https://its-pointless.github.io/setup-pointless-repo.sh
bash setup-pointless-repo.sh

## Dev tools
pkg install git nano openssh
ssh-keygen
## Make BASH prompts nicer
echo "PS1=\"\[\033[33m\][\d \t] \[\033[37m\]\W\$ \"" >> $HOME/.bashrc

## Python CLI + some packages 
pkg install python numpy scipy 
pip install pandas Cython
NPY_NUM_BUILD_JOBS=1 pip install scikit-learn
NPY_NUM_BUILD_JOBS=1 pip install pystan

pkg install freetype
pip install matplotlib 

pkg install libzmq
pip install jupyter
jupyter-notebook --generate-config
echo "c.NotebookApp.ip = \"0.0.0.0\"" >> $HOME/.jupyter/jupyter_notebook_config.py
## termux IP is now 100.115.92.2

## http access 
pkg install libxml2 libxslt
pip install requests lxml  # BeautifulSoup4 html5lib

## Dark theme
pip install jupyterthemes 
jt -t chesterish
