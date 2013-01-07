
class solr (
    $active_cores = [],
    $install_source = "",
    $version        = "",
    $solr_home      = "/etc/solr",

){
    exec { 'apt-get update':
        command => '/usr/bin/apt-get update'
    }

    package { "tomcat6":
        ensure => present,
        require => Exec['apt-get update'],
    }

    service { "tomcat6":
        ensure => running,
        require => Package["tomcat6"],
    }

    class { "solr::install":
        solr_home       => $solr_home,
        install_source  => $install_source,
        version         => $version,
        require         => Service['tomcat6'],
    }

    class { "solr::config":
        solr_home       => $solr_home,
        cores           => $active_cores,
    }

}











