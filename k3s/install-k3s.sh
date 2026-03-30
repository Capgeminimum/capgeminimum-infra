#!/bin/bash
set -e

echo "Installation de k3s sur Raspberry Pi 5"

# Verifier si root
if [ "$EUID" -ne 0 ]; then 
   echo "Ce script doit etre execute avec sudo"
   exit 1
fi

# Mise a jour systeme
echo "Mise a jour du systeme..."
apt-get update
apt-get upgrade -y

# Installation dependances
echo "Installation des dependances..."
apt-get install -y curl wget git

# Configuration systeme pour k3s
echo "Configuration du systeme..."
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab

# Installation k3s
echo "Installation de k3s..."
curl -sfL https://get.k3s.io | sh -

# Configuration kubectl
echo "Configuration de kubectl..."
mkdir -p ~/.kube
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
chmod 600 ~/.kube/config
export KUBECONFIG=~/.kube/config

# Installation Helm
echo "Installation de Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Attendre demarrage k3s
echo "Attente du demarrage de k3s..."
sleep 10
while ! kubectl get nodes 2>/dev/null; do
  echo "Attente de k3s..."
  sleep 5
done

echo ""
echo "Installation terminee"
echo ""
kubectl get nodes
echo ""
echo "k3s est maintenant installe et pret"
