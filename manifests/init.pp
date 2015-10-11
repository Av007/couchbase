# == Class: couchbase
#
# Full description of class couchbase here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { couchbase:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class couchbase inherits couchbase::params {

  anchor {'couchbase::begin':
    before => Class['couchbase::install']
  }
  class {'couchbase::install':
    require => Anchor['couchbase::begin']
  }
  class {'couchbase::service':
    require => Class['couchbase::install']
  }
  anchor {'couchbase::end':
    require => Class['couchbase::service']
  }
}
