
class solr (
    $active_cores = [],
    $install_source = "",
    $version        = "",
    $solr_home      = "/etc/solr",

){
    exec { 'apt-get update':
        command => '/usr/bin/apt-get update'
    }

    package { "curl":
          	ensure => present,
         }

     package { "tomcat6":
      	ensure => present,
     }

    service { "tomcat6":
        ensure => running,
        require => Package["tomcat6"],
    }

     class { "solr::install":
         solr_home       => $solr_home,
         install_source  => $install_source,
         version         => $version,
     }

    class { "solr::config":
        solr_home       => $solr_home,
        cores           => $active_cores,
    }

}











