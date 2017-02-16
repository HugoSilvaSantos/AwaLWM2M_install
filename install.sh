#!/usr/bin/env bash

echo -e "\e[1;34mUpdating and Installing Dependencies\e[0m"
sudo apt-get update  
sudo apt-get -y install build-essential gcc git mercurial python cmake python-nose python-lxml

echo -e "\e[1;34mCloning The Repository\e[0m"
cd ..  
git clone https://github.com/FlowM2M/AwaLWM2M.git  
cd AwaLWM2M

# The Version of GnuTLS may vary for different OS
echo -e "\e[1;34mInstalling GnuTLS\e[0m"
sudo apt-get -y install libgnutls28-dev

echo -e "\e[1;34mBulding AwaLWM2M\e[0m"
make CMAKE_OPTIONS="-DWITH_GNUTLS=ON -DBUILD_TESTS=OFF"
sudo make install

echo -e "\e[1;34mInstallation Complete\e[0m"
awa_clientd -h