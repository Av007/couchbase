class couchbase () inherits couchbase::params {

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
