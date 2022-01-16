#!/bin/bash
cat <<EOF | sudo tee /etc/modules-load.d/crio.conf
      overlay
      br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter
 cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
           net.bridge.bridge-nf-call-iptables  = 1
           net.ipv4.ip_forward                 = 1
           net.bridge.bridge-nf-call-ip6tables = 1
EOF
sudo sysctl --system
    export OS=xUbuntu_20.04
    export VERSION=1.21
    echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
    echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$VERSION/$OS/ /" > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$VERSION.list
    curl -L https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:$VERSION/$OS/Release.key | apt-key add -
    curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS/Release.key | apt-key add -
    apt-get update
    apt-get install cri-o cri-o-runc cri-tools -y
    mkdir -p /etc/crio
    echo conmon="/usr/bin/conmon" >> /etc/crio/crio.conf


sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

sleep 30

useradd yatish 
echo yatish:yakrish1! | chpasswd
echo "yatish ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 

#systemctl enable cri-o.service
#systemctl start cri-o.service

