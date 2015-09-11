#!/bin/bash

echo "Installing required plugins"
echo "Go grab a coffee!"

echo "1/4 - vagrant-vbguest"
echo "Automatically installs the host's VirtualBox Guest Additions on the guest system"
vagrant plugin install vagrant-vbguest

echo "2/4 - vagrant-omnibus"
echo "Installs chef on the guest system"
vagrant plugin install vagrant-omnibus

echo "3/4 - vagrant-librarian-chef"
echo "Automatically installs chef cookbooks when we fire up our machine"
vagrant plugin install vagrant-librarian-chef

echo "4/4 - vagrant-hostmanager"
echo "Automatically adds entries to host's /etc/hosts file"
vagrant plugin install vagrant-hostmanager

echo "We are done here!"
