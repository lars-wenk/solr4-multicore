
class solr::config(
    $solr_home,
    $cores
) {

    file {
        "/etc/tomcat6/Catalina/localhost/solr.xml":
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('solr/catalina.solr.xml.erb'),
        require => Exec['solr-install'];

        "${solr_home}/solr.xml":
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('solr/solr.xml.erb'),
        require => Exec['solr-install'];

        "solrinitscript":
        ensure  => file,
        path    => '/etc/init.d/solr',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template('solr/solr.init.erb'),
        require => Exec['solr-install'];
    }
}