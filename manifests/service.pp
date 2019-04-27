# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include coredns::service
class coredns::service {

  include 'systemd'
  systemd::unit_file {'coredns.service':
    content => template('coredns/service.epp'),
  }
  ~> service {'coredns':
    ensure => 'running',
  }
}
