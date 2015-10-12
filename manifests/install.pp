class couchbase::install {

  package {$couchbase::params::package:
    ensure => present,
  }

  exec {'couchbase_add_lib_repo':
    cwd     => '/tmp/',
    command => "sudo /usr/bin/wget -O /etc/yum.repos.d/couchbase.repo http://packages.couchbase.com/rpm/couchbase-centos62-x86_64.repo",
    timeout => 1200
  }

  exec {'couchbase_install_lib_packaes':
    cwd     => '/tmp/',
    command => "sudo yum install -y libcouchbase2 libcouchbase-devel",
    timeout => 1200
  }

  exec {'couchbase_download_package':
    cwd     => '/opt/',
    command => "/usr/bin/wget http://packages.couchbase.com/releases/4.0.0/couchbase-server-enterprise-4.0.0-centos6.x86_64.rpm",
    timeout => 1200
  }

  exec {'couchbase_install_package':
    cwd     => '/tmp/',
    command => "sudo ${couchbase::params::installer} -i /opt/couchbase-server-enterprise-4.0.0-centos6.x86_64.rpm",
    require => [Package[$couchbase::params::package]],
    unless  => '/usr/bin/test -d /opt/couchbase/'
  }

  /*exec {'couchbase_start':
    cwd     => '/tmp/',
    command => "sudo /opt/couchbase/bin/couchbase-server start",
    timeout => 1200
  }*/
}
#ENV CB_REST_USERNAME Administrator
#ENV CB_REST_PASSWORD password
