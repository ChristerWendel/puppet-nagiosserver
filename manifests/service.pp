# == Class: nagiosserver::service
#
# Controls the nagiosserver service
class nagiosserver::service {
  $icinga = $nagiosserver::icinga
  $conf_dir = $nagiosserver::conf_dir
  $ensure = $nagiosserver::start ? {true => running, default => stopped}

  if ($icinga) {
    $service = 'icinga'
  } else {
    $service = 'nagios3'
  }

  exec { 'make-nagios-config-readable':
    command     => "/usr/bin/find ${conf_dir} -type f | xargs chmod +r",
    refreshonly => true,
  }

  service { $service:
    ensure  => $ensure,
    enable  => $nagiosserver::enable,
    require => Exec['make-nagios-config-readable'],
  }
}
