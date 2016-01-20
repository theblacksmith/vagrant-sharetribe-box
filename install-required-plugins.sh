#!/bin/bash

echo "Installing required plugins"
echo "Go grab a coffee!"

echo "1/3 - vagrant-vbguest"
echo "Automatically installs the host's VirtualBox Guest Additions on the guest system"
vagrant plugin install vagrant-vbguest

echo "2/3 - vagrant-omnibus"
echo "Installs chef on the guest system"
vagrant plugin install vagrant-omnibus

echo "3/3 - vagrant-hostmanager"
echo "Automatically adds entries to host's /etc/hosts file"
vagrant plugin install vagrant-hostmanager

echo "We are done here!"
