solr4-multicore
===============

Vagrant puppet configuration for create a solr4 multicore virtual box (UBUNTU ONLY).
This solution includes also autocomplete configuration.


<b>No Ubuntu Box? Download it</b>

At first download a ubuntu vagrant box at http://www.vagrantbox.es/ (for example: https://dl.dropbox.com/u/1543052/Boxes/UbuntuServer12.04amd64.box) or similar and define it as "ubuntu1204".

<b>Configuration</b>

<i>Vagrantfile</i>

Customize the Main-Configuration-File (you can also leave it as default).

<ul>
    <li>IP-Address, default is "192.168.40.44"</li>
    <li>Vagrant-Box, default is "ubuntu1204"</li>
</ul>

<i>/manifests/site.dev</i>

<ul>
    <li>version, default is "apache-solr-4.0.0"</li>
    <li>install_source, default is "http://apache.mirror.iphh.net/lucene/solr/4.0.0/apache-solr-4.0.0.tgz"</li>
    <li>cores, default is "dev,staging,prod"</li>
</ul>

Define the cores and fields for schema.xml
This 3 cores using the same fields

```
solr::core { [ 'shop1_dev', 'shop1_staging', 'shop1_prod' ]:
    fields      => [
        {'name' => 'id',         'type' => 'string',       'indexed' => 'true', 'stored' => 'true', 'multiValued' => 'false', 'required' => 'true'},
        {'name' => 'title',      'type' => 'text_general', 'indexed' => 'true', 'stored' => 'true', 'multiValued' => 'true',  'required' => 'true'},
        {'name' => 'description','type' => 'text_general', 'indexed' => 'true', 'stored' => 'true', 'multiValued' => 'true',  'required' => 'true'},
        {'name' => 'color',      'type' => 'string',       'indexed' => 'true', 'stored' => 'true', 'multiValued' => 'true',  'required' => 'true'},
    ],
    copyfields  => [
        {'source' => 'id'},
        {'source' => 'title'},
        {'source' => 'description'},
        {'source' => 'color'},
    ],
    spellfields => [
        {'source' => 'id'},
        {'source' => 'title'},
        {'source' => 'description'},
    ],
    require     => Exec['solr-install']
}

```

<i>copyfields</i> - for joining with the standard-search-field "text" as destination <br />
<i>spellfields</i> - for joining with the autosuggest-search-field "spell" as destination<br /><br />

For using cores with individual fields:

```
solr::core { [ 'shop1_dev', 'shop1_staging', 'shop1_prod' ]:
    fields      => [
        {'name' => 'id',         'type' => 'string',       'indexed' => 'true', 'stored' => 'true', 'multiValued' => 'false', 'required' => 'true'},
        {'name' => 'title',      'type' => 'string',       'indexed' => 'true', 'stored' => 'true', 'multiValued' => 'true',  'required' => 'false'},
        ...
    ],
    ...
}


solr::core { [ 'shop2_dev', 'shop2_staging', 'shop2_prod' ]:
    fields      => [
        {'name' => 'id',         'type' => 'string',       'indexed' => 'true', 'stored' => 'true', 'multiValued' => 'false', 'required' => 'true'},
        {'name' => 'name',       'type' => 'string',       'indexed' => 'true', 'stored' => 'true', 'multiValued' => 'false', 'required' => 'false'},
        ...
    ],
    ...
}

```


<b>Starting the box</b>

vagrant up solr


