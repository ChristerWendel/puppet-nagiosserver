# == Class: nagiosserver::configure
#
# Configures the nagios server
class nagiosserver::configure {
  $hosts = $nagiosserver::hosts
  $services = $nagiosserver::services
  $conf_dir = $nagiosserver::conf_dir
  $adminaddress = $nagiosserver::adminaddress

  file { ['/etc/nagios3/conf.d/contacts_nagios2.cfg',
          '/etc/nagios3/conf.d/extinfo_nagios2.cfg',
          '/etc/nagios3/conf.d/hostgroups_nagios2.cfg',
          '/etc/nagios3/conf.d/localhost_nagios2.cfg',
          '/etc/nagios3/conf.d/services_nagios2.cfg',]:
            ensure => absent,
  }

  nagios_contact { 'nagiosadmin':
    email                         => $adminaddress,
    target                        => '/etc/nagios3/conf.d/contacts.cfg',
    service_notification_commands => 'notify-service-by-email',
    host_notification_commands    => 'notify-host-by-email',
  }

  nagios_contactgroup { 'admins':
    members => 'nagiosadmin',
    target  => '/etc/nagios3/conf.d/contactgroups.cfg',
  }

  nagiosserver::add_nagios_host { $hosts: }

  nagiosserver::add_nagios_service { $services: }
}
