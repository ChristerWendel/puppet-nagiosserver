# == Class: nagiosserver::configure
#
# Configures the nagios server
class nagiosserver::configure {
  $hosts = $nagiosserver::hosts
  $services = $nagiosserver::services
  $conf_dir = $nagiosserver::conf_dir

  nagiosserver::add_nagios_host{ $hosts: }

  nagiosserver::add_nagios_service{ $services: }
}
