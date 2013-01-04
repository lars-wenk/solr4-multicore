
class solr::install($solr_home,$version,$install_source) {

    exec { "solr-download":
        command => "wget ${install_source}",
        cwd => "/home/vagrant/",
        creates => "/home/vagrant/${version}.tgz",
        path => ["/usr/bin", "/usr/sbin/"]
    }

    exec { "solr-inflate":
        command => "tar xzf ${version}.tgz",
        cwd => "/home/vagrant/",
        creates => "/home/vagrant/apache-solr4/",
        path => "/bin/",
        require => Exec["solr-download"]
    }

    exec { "solr-createdirectory":
        command => "mkdir ${solr_home}",
        cwd => "/home/vagrant/",
        path => ["/usr/bin", "/usr/sbin/", "/bin/"],
    }

    exec { "solr-install":
        command => "cp -R apache-solr-4.0.0/example/multicore/bin ${solr_home}/bin | cp apache-solr-4.0.0/example/multicore/zoo.cfg ${solr_home}/ | cp -R apache-solr-4.0.0/example/webapps/solr.war ${solr_home}/",
        cwd => "/home/vagrant/",
        path => ["/usr/bin", "/usr/sbin/", "/bin"],
        require => Exec["solr-inflate"]
    }

}