Vagrant::Config.run do |config|

    #### SolrServer ####
    config.vm.define :solr do |solr_config|
        solr_config.vm.box = "ubuntu1204"
        solr_config.vm.host_name = "solr"
        solr_config.ssh.max_tries = 100
        solr_config.vm.customize ["modifyvm", :id, "--memory", "256"]
        solr_config.vm.network :hostonly, "192.168.40.44"
        solr_config.vm.provision :puppet do |solr_puppet|
            solr_puppet.pp_path = "/tmp/vagrant-puppet"
            solr_puppet.manifests_path = "manifests"
            solr_puppet.module_path = "modules"
            solr_puppet.manifest_file = "site.dev"
            solr_puppet.options = "--verbose"
        end
    end

end