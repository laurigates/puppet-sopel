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
  $owner = '',
  $logdir = '/var/log/sopel',
  $pid_dir = '/run/sopel',
  $homedir = '/var/lib/sopel',
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
    home    => '/etc/sopel',
    shell   => '/usr/sbin/nologin',
    system  => true,
  }
  
  file { '/etc/sopel':
    ensure => 'directory',
    group  => 'sopel',
    owner  => 'sopel',
    mode   => '0755',
  }
}
