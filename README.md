solr4-multicore
===============

Vagrant puppet configuration for create a solr4 multicore virtual box (UBUNTU ONLY).
This solution includes also autocomplete configuration.


<b>No Ubuntu Box? Download it</b>

At first download a ubuntu vagrant box at http://www.vagrantbox.es/ (for example: https://dl.dropbox.com/u/1543052/Boxes/UbuntuServer12.04amd64.box) or similar and define it as "ubuntu1204".

<b>Configuration</b>

<i>Vagrantfile</i>

Customize the Main-Configuration-File (you can also leave it as default).

IP-Address, default is "192.168.40.44"
Vagrant-Box, default is "ubuntu1204"

<i>/manifests/site.dev</i>

version, default is "apache-solr-4.0.0"
install_source, default is "http://apache.mirror.iphh.net/lucene/solr/4.0.0/apache-solr-4.0.0.tgz"
cores, default is "dev,staging,prod"

Configure the fields for schema.xml, the uniqueKey is "id".

<b>Starting the box</b>

vagrant up solr


