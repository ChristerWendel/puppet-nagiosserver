# == Class: nagiosserver::install
#
# Installs the nagios server packages
class nagiosserver::install {
  $icinga = $nagiosserver::icinga
  $adminpassword = $nagiosserver::adminpassword

  if ($icinga) {
    $base_package = 'icinga'
  } else {
    $base_package = 'nagios3'
  }

  package { "${base_package}-core":
    ensure => $nagiosserver::version,
  } ->
  file { '/tmp/nagios3-cgi.preseed':
    ensure  => present,
    content => template('nagiosserver/nagios3-cgi.erb'),
    mode    => '0600',
  } ->
  package { "${base_package}-cgi":
    ensure       => $nagiosserver::version,
    responsefile => '/tmp/nagios3-cgi.preseed',
    require      => File['/tmp/nagios3-cgi.preseed'],
  } ->
  package { $base_package:
    ensure => $nagiosserver::version,
  } ->
  package { 'nagios-nrpe-plugin':
    ensure => $nagiosserver::version,
  }
}
