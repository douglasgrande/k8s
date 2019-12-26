require 'yaml'

VAGRANTFILE_API_VERSION = "2"
COMMON = YAML.load_file './configs/variables.yml'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # Common Setup
    config.vm.box = COMMON['config']['box']
end

# Mongo Cluster
vagrantfiles = %w[vms/KubernetesMaster.rb 
                  vms/KubernetesNode01.rb 
                  vms/KubernetesNode02.rb]
    vagrantfiles.each do |vagrantfile|
    load File.expand_path(vagrantfile) if File.exists?(vagrantfile)
end