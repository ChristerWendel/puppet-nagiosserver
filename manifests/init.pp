# == Class: nagiosserver
#
# A module to handle nagios servers
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["adminpassword"]
#   Password for `nagiosadmin' user
#
# ["conf_dir"]
#   Configuration directory for Nagios
#
# ["hosts"]
#   An array of hashes with host information
#
# ["services"]
#   An array of hashes with service information
#
# ["adminaddress"]
#   E-mail address of nagios admin
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet

class nagiosserver (
  $version = 'present',
  $adminpassword = 'nagiosadmin',
  $conf_dir = '/etc/nagios3/conf.d',
  $hosts = [ { hostname => 'localhost', ipaddress => '127.0.0.1',} ],
  $services = [ { name => 'disk', command => 'check_disk',} ],
  $adminaddress = 'root@localhost',
  $enable = true,
  $start = true
  )  {
    class{'nagiosserver::install': } ->
    class{'nagiosserver::configure': } ~>
    class{'nagiosserver::service': } ->
    Class['nagiosserver']
  }
