Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.define :kubernetesnode01 do |kubernetesnode01|
        kubernetesnode01.vm.hostname = COMMON['kubernetesnode01']['hostname']
        kubernetesnode01.vm.network COMMON['kubernetesnode01']['network'], 
            virtualbox__intnet: COMMON['kubernetesnode01']['intnet'], 
            ip: COMMON['kubernetesnode01']['ip']

        kubernetesnode01.vm.provision "docker-install",
            type: "shell", 
            path: "./scripts/docker.sh"

        kubernetesnode01.vm.provision "kubernetes-install",
            type: "shell", 
            path: "./scripts/kubernetes.sh"
    end
end