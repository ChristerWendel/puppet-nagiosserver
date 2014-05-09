# Helper function to add nagios service entries
define nagiosserver::add_nagios_service {
  $conf_dir = $nagiosserver::conf_dir

  nagios_hostgroup { $title['name']:
    target  => "${conf_dir}/hostgroups.cfg",
  }

  nagios_service { $title['name']:
    hostgroup_name      => $title['name'],
    service_description => $title['description'],
    check_command       => $title['command'],
    use                 => 'generic-service',
    target              => "${conf_dir}/services.cfg",
  }
}
