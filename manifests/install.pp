# == Class: nagiosserver::install
#
# Installs the nagios server packages
class nagiosserver::install {
  $adminpassword = $nagiosserver::adminpassword

  package { 'nagios-nrpe-plugin':
    ensure => $nagiosserver::version,
  }

  package { 'nagios3-core':
    ensure => $nagiosserver::version,
  }

  file { '/tmp/nagios3-cgi.preseed':
    ensure  => present,
    content => template('nagiosserver/nagios3-cgi.erb'),
    mode    => '0600',
  }

  package { 'nagios3-cgi':
    ensure       => $nagiosserver::version,
    responsefile => '/tmp/nagios3-cgi.preseed',
    require      => File['/tmp/nagios3-cgi.preseed'],
  }
}
