#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

sudo apt-get remove needrestart -y
sudo apt-get update && sudo apt-get --yes --force-yes upgrade
sudo apt install snapd -y 
#sudo snap install microk8s --classic --channel=1.27/stable
#sudo usermod -a -G microk8s $USER
#sudo mkdir -p $HOME/.kube
#sudo chown -R $USER:$USER $HOME/.kube
#sudo microk8s.kubectl config view --raw > $HOME/.kube/config
#su - $USER
#sudo snap alias microk8s.kubectl kubectl
