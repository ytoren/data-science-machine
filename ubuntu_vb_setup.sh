#! /bin/sh
sudo apt-get update 
sudo apt-get upgrade

######################
# VBox guest additions
######################
sudo apt-get install build-essential
## insert guest addtions CDROM
sudo mount /dev/cdrom /media/cdrom
sudo /media/cdrom/VBoxLinuxAdditions.run
# sudo groupadd vboxsf
sudo usermod -a -G vboxsf $USER

###################
# Graphical env
################
sudo apt-get install xfce4 lightdm lightdm-gtk-greeter byobu terminator firefox 
sudo apt-get autoremove  && sudo apt-get clean && sudo apt-get autoclean

#####################
# Common tools
###############
sudo apt-get install wget gdebi-core software-properties-common net-tools nano apt-transport-https
sudo apt-get autoremove  && sudo apt-get clean && sudo apt-get autoclean
#sudo purge-old-kernels

#############
# Base R
#############
sudo apt-get install apt-transport-https
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cran.rstudio.com/bin/linux/ubuntu artful/'
sudo apt-get update

sudo apt-get install r-base r-cran-rjava default-jdk-headless curl libcurl4-openssl-dev libxml2-dev libssl-dev libsecret-1-dev
sudo apt-get autoremove  && sudo apt-get clean && sudo apt-get autoclean
# R CMD BATCH 
echo "install.packages(c('rmarkdown', 'formatR', 'shiny','tidyverse', 'gridExtra', 'nlme',  'h2o', 'randomForest', 'xgboost', 'caret', 'sparklyr'));
require(sparklyr);
spark_install(version = '2.1.0')" > R_setup.R
# in R: source('R_setup.R')


##################
# Rstudio client 
##################
## Get link from https://www.rstudio.com/products/rstudio/download/
sudo apt-get install libxslt1-dev
wget https://download1.rstudio.org/rstudio-1.0.136-amd64.deb 
sudo gdebi rstudio-1.0.136-amd64.deb

#################
# Rstudio server
#################
## Links: https://www.rstudio.com/products/rstudio/download-server/
sudo apt-get install gdebi-core
wget https://download2.rstudio.org/rstudio-server-1.1.453-amd64.deb
sudo gdebi rstudio-server-1.1.453-amd64.deb
sudo rstudio-server verify-installation


###################
# Jupyter / Python
###################
# 2.7 Kernel
sudo apt-get install python-pip 
sudo apt-get autoremove  && sudo apt-get clean && sudo apt-get autoclean
sudo -H pip install --upgrade pip
sudo -H pip install jupyter keras numpy pandas scikit-learn tensorflow protobuf matplotlib pystan pymc3 seaborn
sudo python2 -m pip install ipykernel
sudo python2 -m ipykernel install --user
# 3 Kernel
sudo apt-get install python3-pip 
sudo apt-get autoremove  && sudo apt-get clean && sudo apt-get autoclean
# sudo python3 -m pip --upgrade pip
sudo -H python3 -m pip install ipykernel jupyter keras numpy pandas scikit-learn tensorflow protobuf matplotlib pystan pymc3 seaborn 
sudo -H python3 -m ipykernel install --user
# Extentions
sudo -H python3 -m pip install jupyter_nbextensions_configurator jupyter_contrib_nbextensions
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
# Jupyter autostart
echo "[Unit]
Description=Jupyter Workplace

[Service]
Type=simple
PIDFile=/run/jupyter.pid
ExecStart=/usr/local/bin/jupyter-notebook
User=oberlods
Group=oberlods
WorkingDirectory=/home/oberlods
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
" >> jupyter.service

sudo mv jupyter.service /etc/systemd/system
sudo systemctl enable jupyter.service
sudo systemctl daemon-reload
sudo systemctl restart jupyter.service

# Git
sudo apt-get install git gitg
sudo apt-get autoremove  && sudo apt-get clean && sudo apt-get autoclean

# Scala
sudo apt-get install scala
sudo apt-get autoremove  && sudo apt-get clean && sudo apt-get autoclean

# Docker
# https://docs.docker.com/engine/installation/linux/ubuntu/
sudo apt-get install linux-image-extra-virtual apt-transport-https ca-certificates curl software-properties-common 
# removed linux-image-extra-$(uname -r)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88	
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
sudo apt-get update
sudo apt-get install docker-ce
#apt-cache madison docker-ce
sudo apt-get autoremove  && sudo apt-get clean && sudo apt-get autoclean
sudo groupadd docker
sudo usermod -aG docker $USER
# logout/in to get the service started

# Vbox mounts
# sudo mount -t vboxsf -o rw,uid=$UID,gid=$(id -g) c_temp /home/izzie/c_temp
# sudo usermod -a -G vboxsf <username>
