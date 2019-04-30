# coredns

#### Table of Contents

1. [Description](#description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

Puppet module to install CoreDNS Server.

## Usage

Install CoreDNS & systemd unit without any zone and default parameters:
```
include coredns
```

Create a DNS zone `.` that match all request, with prometheus, logs and error plugin that forward all
request to google public DNS `8.8.8.8`:
```
coredns::zone { '.':
  prometheus                => true,
  prometheus_listen_address => $facts['ipaddress'],
  prometheus_listen_port    => 9153,
  log                       => true,
  errors                    => true,
  forward                   => true,
  forward_to                => ['8.8.8.8'],
}
```

Create a DNS zone that match all requests to `example.local` using auto plugin which read zones from /etc/coredns/zones directory:
```
coredns::zone { 'example.local':
  log         => true,
  errors      => true,
  auto        => 'example.local',
  auto_config => {
    'directory' => '/etc/coredns/zones',
  },
}
```

## Reference

This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

For example:

```
### `pet::cat`

#### Parameters

##### `meow`

Enables vocalization in your cat. Valid options: 'string'.

Default: 'medium-loud'.
```

## Limitations

This module only configure coredns installation, service, and `Corefile` configuration. It does not configure DNS zone entries & records.

## Development

This module is actually being developped. New features may come soon!
Feel free to contriute!
