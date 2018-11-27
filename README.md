[![Build Status](https://travis-ci.org/savoiringfaire/puppet-sopel.svg?branch=master)](https://travis-ci.org/savoiringfaire/puppet-sopel)

# sopel
#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with sopel](#setup)
    * [Beginning with sopel](#beginning-with-sopel)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

The sopel IRC bot is a fully featured Python-powered IRC bot that can be found at https://github.com/sopel-irc. This puppet module serves to install and configure the bot.

Not all configuration options are included as of the initial release, however pull requests are welcome if you need another module added - just add the option to the parameters to the init.pp file, and then use it in the configuration template file.

## Setup

### Beginning with sopel

```puppet
include savoirfaire-sopel

class sopel { 'sopel':
  channels => ['#channel-1', 'channel-2'],
  nick     => 'Sopel',
  host     => 'irc.freenode.net',
  port     => 6679,
  owner    => 'savoir-faire'
}
```

## Reference

There is only one class. The current supported parameters are:

### `sopel::sopel`
#### Parameters
##### `channels`

A list of channels for the installation of sopel to connect to.

Default: `[]`

##### `nick`

The nickname that the sopel bot will use when connecting to IRC.

Default: `'sopel'`

##### `host`

The hostname of the irc server to connect to. This can either be a domain name or an ip address.

Default: `'irc.freenode.net'`

##### `port`

The port on which the IRC server is running on the host.

Default: `6697`

##### `use_ssl`

Whether the sopel irc bot should use ssl when connecting to the host.

Default: `true`

##### `verify_ssl`

Whether the sopel irc bot should validate the ssl certificate of the host before connecting (MUST be set to false if using ip address).

Default: `true`

##### `owner`

The irc nick of the owner of the irc bot. This person has permission to ask the bot to join extra channels as well as other permissions. This MUST be set.

Default: `undef`

##### `logdir`

The directory into which the sopel irc bot logs should be put.

Default: `/var/log/sopel`

##### `pid_dir`

The directory into which the sopel irc pid file should be put.

Default: `/run/sopel`

##### `homedir`

The home directory of the sopel user to create. This is where it stores its database and configuration files.

Default: `/var/lib/sopel`

##### `auth_method`

The method the sopel irc bot should use to connect to the host. Can either be `nil` for no auth, or `nickserv` for nickserv authentication.

Default: `undef`

##### `auth_password`

The password the sopel irc bot should use to connect to the host. This is ignored if the auth_method setting above is set to `nil`.

Default: `undef`

## Limitations

Current known limitations are:
 - No ability to disable or remove modules
 - Not all of the configuration options are included
 
If there are any other issues you run into, please open a github issue.

## Development

All contributions are appreciated. The only rule is to be a good person!

All work should be submitted as a merge request which should be related to an issue. If you are doing work on an already opened issue, it is worth adding a comment to said issue to make sure there is no duplicated work.
