class couchbase::params {

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $package   = 'libssl0.9.8'
      $installer = '/usr/bin/dpkg'
    }
    /^(CentOS)$/: {
      $package   = 'openssl098e'
      $installer = '/usr/bin/yum install -y'
    }
    /^(RedHat)$/: {
      $package   = 'openssl098e'
      $installer = '/bin/rpm -i'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
