# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include sopel
class sopel(
  $channels = [],
  $nick = 'Sopel',
  $host = 'irc.freenode.net',
  $port = '6697',
  $use_ssl = true,
  $verify_ssl = true,
  $owner = undef,
  $logdir = '/var/log/sopel',
  $pid_dir = '/run/sopel',
  $homedir = '/var/lib/sopel',
  $auth_method = undef,
  $auth_password = undef,
) {
  package { 'python-enchant':
    ensure => 'installed',
  }

  class { 'python':
    version    => '3.7.0',
  }

  python::pip { 'sopel':
    ensure => '6.5.3',
  }
  
  user { 'sopel':
    ensure  => 'present',
    comment => 'User as which the sopel IRC client will run',
    expiry  => 'absent',
    home    => $homedir,
    shell   => '/usr/sbin/nologin',
    system  => true,
  }
  
  file { '/etc/sopel':
    ensure => 'directory',
    group  => 'sopel',
    owner  => 'sopel',
    mode   => '0755',
  }
  
  file { $homedir:
    ensure => 'directory',
    group  => 'sopel',
    owner  => 'sopel',
    mode   => '0755',
  }
  
  file { '/etc/sopel/sopel.cfg':
    ensure  => 'file',
    content => template('sopel/sopel.cfg.erb'),
    owner   => 'sopel',
    group   => 'sopel',
    mode    => '0644',
    notify  => Service['sopel'],
  }
  
  file { '/etc/systemd/system/sopel.service':
    ensure  => 'file',
    content => file('sopel/sopel.service'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['sopel'],
  }
  
  service { 'sopel':
    ensure => 'running',
    enable => true,
  }
}
