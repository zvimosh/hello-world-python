#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done


sudo apt update -y
sudo apt upgrade -y
sudo apt install snapd -y
sudo snap install microk8s --classic --channel=1.27/stable
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
su - $USER
sudo snap alias microk8s.kubectl kubectl

