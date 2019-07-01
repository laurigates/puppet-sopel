# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include sopel
class sopel(
  $version,
  $channels,
  $nick,
  $host,
  $port,
  $use_ssl,
  $verify_ssl,
  $owner,
  $logdir,
  $pid_dir,
  $homedir,
  $auth_method,
  $auth_password,
  $enable,
) {
  include ::python

  package { 'python-enchant':
    ensure => installed,
  }

  python::pip { 'sopel':
    ensure  => $version,
    require => Package['python-enchant'],
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
