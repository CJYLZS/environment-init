# https://www.cnblogs.com/thepoy/p/14803739.html
sudo swapoff -a
# close swap by comment swap in /etc/fstab
echo "close swap by comment swap in /etc/fstab"
cat /etc/fstab

# lsmod | grep br_netfilter
# sudo modprobe br_netfilter


echo "add br_netfilter into /etc/modules-load.d/k8s.conf"
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
br_netfilter
EOF

echo "add netbrige conf into /etc/sysctl.d/k8s.conf"
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system


# cni plugin

mkdir -p /etc/cni/net.d/
cat <<EOF > /etc/cni/net.d/10-flannel.conf
{"name":"cbr0","type":"flannel","delegate": {"isDefaultGateway": true}}
EOF



sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -s https://gitee.com/thepoy/k8s/raw/master/apt-key.gpg | sudo apt-key add -
echo "deb https://mirrors.tuna.tsinghua.edu.cn/kubernetes/apt kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list


sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

sudo kubeadm config images list

echo "use proxy to pull docker image from k8s.gcr.io (config /etc/systemd/system/docker.service.d/http-proxy.conf)"
echo "change docker Cgroup driver from cgroups to systemd (config /etc/docker/daemon.json)"
echo "final run kubeadm init ..."
echo "sudo kubeadm init --apiserver-advertise-address=192.168.101.134 --service-cidr=10.96.0.0/12 --pod-network-cidr=10.244.0.0/16"



# May 31 11:30:08 ylzs-master kubelet[783]: I0531 11:30:08.687141     783 cni.go:240] "Unable to update cni config" err="no networks found in /etc/cni/net.d"
# May 31 11:30:08 ylzs-master kubelet[783]: E0531 11:30:08.957654     783 kubelet.go:2386] "Container runtime network not ready" networkReady="NetworkReady=false reason:NetworkPluginNotReady message:docker: network plugin is not ready: cni config uninitialized"
# https://blog.csdn.net/qq_26545503/article/details/123183184
