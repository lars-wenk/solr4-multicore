
class solr::install($solr_home,$version,$install_source) {

    exec { "solr-download":
        command => "wget ${install_source}",
        cwd => "/home/vagrant/",
        creates => "/home/vagrant/${version}.tgz",
        path => ["/usr/bin", "/usr/sbin/"],
        require => Service['tomcat6'],
    }

    exec { "solr-inflate":
        command => "tar xzf ${version}.tgz",
        cwd => "/home/vagrant/",
        creates => "/home/vagrant/apache-solr4/",
        path => "/bin/",
        require => Exec["solr-download"]
    }

    file { "${solr_home}":
        ensure  => "directory",
        owner   => 'tomcat6',
        group   => 'tomcat6',
        mode    => '0755',
    }

    exec { "solr-install":
        command => "cp -R ${version}/example/multicore/bin ${solr_home}/bin | cp ${version}/example/multicore/zoo.cfg ${solr_home}/ | cp -R ${version}/example/webapps/solr.war ${solr_home}/",
        cwd => "/home/vagrant/",
        path => ["/usr/bin", "/usr/sbin/", "/bin"],
        require => Exec["solr-inflate"]
    }

}