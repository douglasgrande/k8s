Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :kubernetesmaster do |kubernetesmaster|
        kubernetesmaster.vm.hostname = COMMON['kubernetesmaster']['hostname']
        kubernetesmaster.vm.network COMMON['kubernetesmaster']['network'], 
            virtualbox__intnet: COMMON['kubernetesmaster']['intnet'], 
            ip: COMMON['kubernetesmaster']['ip']

        kubernetesmaster.vm.provision "docker-install",
            type: "shell", 
            path: "./scripts/docker.sh"

        kubernetesmaster.vm.provision "kubernetes-install",
            type: "shell", 
            path: "./scripts/kubernetes.sh"
    end
end