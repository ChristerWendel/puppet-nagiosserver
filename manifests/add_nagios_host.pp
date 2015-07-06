# Helper function to add nagios host entries
define nagiosserver::add_nagios_host {
  $conf_dir = $nagiosserver::conf_dir

  nagios_host { $title['hostname']:
    host_name  => $title['hostname'],
    address    => $title['ipaddress'],
    hostgroups => $title['hostgroups'],
    use        => 'generic-host',
    parents    => $title['parents'],
    target     => "${conf_dir}/hosts.cfg",
  }
}
