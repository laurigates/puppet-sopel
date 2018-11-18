# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include sopel
class sopel(
  $channels = [],
  $nick = "Sopel",
  $host = "irc.freenode.net",
  $port = "6697",
  $use_ssl = true,
  $verify_ssl = true,
  $owner = "",
  $logdir = "/var/log/sopel",
  $pid_dir = "/run/sopel",
  $homedir = "/var/lib/sopel",
) {
  class { 'python':
    version    => '3.7.0',
    dev        => false,
    virtualenv => true,
  }

  python::pip { 'sopel':
    virtualenv => '/opt/sopel',
  }
}
