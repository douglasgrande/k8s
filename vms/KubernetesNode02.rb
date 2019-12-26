Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :kubernetesnode02 do |kubernetesnode02|
        kubernetesnode02.vm.hostname = COMMON['kubernetesnode02']['hostname']
        kubernetesnode02.vm.network COMMON['kubernetesnode02']['network'], 
            virtualbox__intnet: COMMON['kubernetesnode02']['intnet'], 
            ip: COMMON['kubernetesnode02']['ip']

        kubernetesnode02.vm.provision "docker-install",
            type: "shell", 
            path: "./scripts/docker.sh"

        kubernetesnode02.vm.provision "kubernetes-install",
            type: "shell", 
            path: "./scripts/kubernetes.sh"
    end
end