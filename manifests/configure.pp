# == Class: nagiosserver::configure
#
# Configures the nagios server
class nagiosserver::configure {
  $icinga = $nagiosserver::icinga
  $hosts = $nagiosserver::hosts
  $services = $nagiosserver::services
  $conf_dir = $nagiosserver::conf_dir
  $adminaddress = $nagiosserver::adminaddress

  if ($icinga) {
    $config_suffix = 'icinga'
  } else {
    $config_suffix = 'nagios2'
  }

  file { ["${conf_dir}/contacts_${config_suffix}.cfg",
          "${conf_dir}/extinfo_${config_suffix}.cfg",
          "${conf_dir}/hostgroups_${config_suffix}.cfg",
          "${conf_dir}/localhost_${config_suffix}.cfg",
          "${conf_dir}/services_${config_suffix}.cfg",]:
            ensure => absent,
  }

  nagios_contact { 'nagiosadmin':
    email                         => $adminaddress,
    target                        => "${conf_dir}/contacts.cfg",
    service_notification_commands => 'notify-service-by-email',
    host_notification_commands    => 'notify-host-by-email',
    service_notification_period   => '24x7',
    host_notification_period      => '24x7',
    service_notification_options  => 'w,u,c,r',
    host_notification_options     => 'd,r',
  }

  nagios_contactgroup { 'admins':
    members => 'nagiosadmin',
    target  => "${conf_dir}/contactgroups.cfg",
  }

  nagiosserver::add_nagios_host { $hosts: }

  nagiosserver::add_nagios_service { $services: }
}
