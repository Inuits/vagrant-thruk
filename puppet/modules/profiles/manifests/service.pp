#service.pp
class profiles::service {

  file{'mk-live':
    path    => '/usr/local/icinga/var/rw/live',
    ensure  => present,
    mode    => '0777',
    require => Service['ido2db'],
  }  

  service  {'thruk':
    ensure  => running,
    require => File['mk-live'],
  }

  service {'ido2db':
    ensure  => running,
  }
}
