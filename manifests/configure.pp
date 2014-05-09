# == Class: nagiosserver::configure
#
# Configures the nagios server
class nagiosserver::configure {
  $hosts = $nagiosserver::hosts
  $services = $nagiosserver::services
  $conf_dir = $nagiosserver::conf_dir

  file { ['/etc/nagios3/conf.d/extinfo_nagios2.cfg',
          '/etc/nagios3/conf.d/hostgroups_nagios2.cfg',
          '/etc/nagios3/conf.d/localhost_nagios2.cfg',
          '/etc/nagios3/conf.d/services_nagios2.cfg',]:
            ensure => absent,
  }

  nagiosserver::add_nagios_host{ $hosts: }

  nagiosserver::add_nagios_service{ $services: }
}
