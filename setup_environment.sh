#!/bin/sh

# update everything
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade
sudo apt-get autoremove

# copy .bash_aliases to ~/
cp ~/Downloads/environment-setup-master/.bash_aliases ~/
# copy .gitconfig to ~/
cp ~/Downloads/environment-setup-master/.gitconfig ~/

# get packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install xclip -y
sudo apt-get install vim -y
sudo apt-get install filezilla -y
sudo apt-get install git -y
sudo apt-get install gnuplot -y
sudo apt-get install chromium-browser -y
sudo apt-get install curl -y
sudo apt-get install texlive-full -y
sudo apt-get install texstudio -y
sudo apt-get install clamav clamav-daemon -y
sudo freshclam
sudo apt-get install xserver-xorg-input-libinput -y
sudo apt-get install exfat-utils exfat-fuse -y
sudo apt-get install vlc -y
sudo apt-get install gdebi-core
sudo apt-get install emacs24
# install Julia
sudo add-apt-repository ppa:staticfloat/juliareleases
sudo add-apt-repository ppa:staticfloat/julia-deps
sudo apt-get update
sudo apt-get install julia -y
# install inconsolata
sudo apt-get install fonts-inconsolata -y
sudo fc-cache -fv
# install R Open
sudo apt-get install MRO-3.3.0-Ubuntu-15.4.x86_64.deb -y
# download MLK (install later in script)
wget https://mran.microsoft.com/install/mro/3.3.0/RevoMath-3.3.0.tar.gz

# install RStudio
wget https://download1.rstudio.org/rstudio-0.99.903-amd64.deb
sudo gdebi -n rstudio-0.99.903-amd64.deb
rm rstudio-0.99.903-amd64.deb
# enable reverse mouse scrolling
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# install Atom text editor
wget https://atom.io/download/deb
dpkg -i deb
# copy Atom files over
cp -rf ~/Downloads/.atom ~/

# install meteor
curl https://install.meteor.com/ | sh

# install Anaconda (follow prompts)
wget http://repo.continuum.io/archive/Anaconda3-4.1.1-Linux-x86_64.sh
bash Anaconda3-4.1.1-Linux-x86_64.sh
# install MLK (follow prompts)
tar -xzf RevoMath-3.3.0.tar.gz
rm RevoMath-3.3.0.tar.gz
cd RevoMath/
sudo ./RevoMath.sh
cd ..
rm -rf RevoMath/

# (install these Python packages after Anaconda installation)
# pip install mkdoc mkdoc-material python-markdown-math

# change default editor to vim
#3 | sudo update-alternatives --config editor

# set global default editor (already in .gitconfig)
# git config --global core.editor "subl -n -w"
