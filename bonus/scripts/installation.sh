echo "\n\n${green}====== Install Helm: =======${reset}\n"
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

echo "\n\n${green}====== Install browser: =======${reset}\n"
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
snap install midori

echo "\n\n${green}====== Install kubectl: =======${reset}\n"

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

sudo yum install -y kubectl

#export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

#curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION="v1.21.8-rc1+k3s2" INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --flannel-iface=eth1 server --node-external-ip 192.168.42.110" sh -s - --docker
