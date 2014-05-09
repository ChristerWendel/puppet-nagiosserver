# == Class: nagiosserver::service
#
# Controls the nagiosserver service
class nagiosserver::service {
  $ensure = $nagiosserver::start ? {true => running, default => stopped}

  exec { 'make-nagios-config-readable':
    command => '/usr/bin/find /etc/nagios3/conf.d -type f | xargs chmod +r',
  }

  service { 'nagios3':
    ensure  => $ensure,
    enable  => $nagiosserver::enable,
    require => Exec['make-nagios-config-readable'],
  }
}
