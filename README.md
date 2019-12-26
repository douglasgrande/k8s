# Pré-Requistos

- Vagrant 2.2.6

https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb

- Virtualbox 6.0.x

https://download.virtualbox.org/virtualbox/6.1.0/virtualbox-6.1_6.1.0-135406~Ubuntu~bionic_amd64.deb

- Rede interna

VBoxManage dhcpserver add --netname kubernetes --ip 10.20.20.100 --netmask 255.255.255.0 --lowerip 10.20.20.101 --upperip 10.20.20.254 --enable

- Executar instalação - VMs

1 - Acessar diretório do arquivo Vagrantfile

2 - Executar [ $ vagrant up ]

- Executar inicialização do Cluster
1 - Acessar diretório do arquivo Vagrantfile

2 - Executar (Master):

2.1 - [ $ vagrant ssh kubernetesmaster ]

2.2 - [ $ sudo su ]

2.3 - [ $ kubeadm init --apiserver-advertise-address 10.20.20.110 ]

2.4 - [ $ mkdir -p $HOME/.kube  ]

2.5 - [ $ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config ]

2.6 - [ $ sudo chown $(id -u):$(id -g) $HOME/.kube/config ]

2.6.1 - Copiar o resultado do comando kubeadm init

"kubeadm join 10.20.20.110:6443 --token ..."

2.7 - [ $ kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')" ]

3 - Executar (Nodes):

3.1 - [ $ vagrant ssh kubernetesnode01 | vagrant ssh kubernetesnode02 ]

3.1 - [ $ route add 10.96.0.1 gw 10.20.20.110 ]

3.1 - Executar o comando salvo no passo 2.6.1
