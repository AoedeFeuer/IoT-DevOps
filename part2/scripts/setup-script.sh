echo "Get network tools..."

sudo yum -y install net-tools.x86_64

echo "Get docker app..."

curl https://releases.rancher.com/install-docker/19.03.sh | sh

echo "Install k3s server..."

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --flannel-iface=eth1 server --node-external-ip 192.168.42.110" sh -s - --docker

echo "Install apps manifests..."

cd manifests
/usr/local/bin/kubectl apply -f one-dc.yml
/usr/local/bin/kubectl apply -f second-dc.yml
/usr/local/bin/kubectl apply -f third-dc.yml

echo "Install ingress..."

/usr/local/bin/kubectl apply -f ingress.yml

echo "Install ok. Maybe it takes some time before host will become available..."


# kubectl get nodes -o wide
# kubectl get all -n kube-system
# ifconfig eth1
# curl -H "Host:app1.com" 192.168.42.110
# curl -H "Host:app2.com" 192.168.42.110
# curl -H "Host:app3.com" 192.168.42.110