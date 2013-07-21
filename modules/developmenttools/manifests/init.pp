class developmenttools {
  # TODO: Improve this workaround
  exec { 'Development Tools':
    unless  => '/usr/bin/yum grouplist "Development Tools" | /bin/grep "^Installed Groups"',
    command => '/usr/bin/yum -y groupinstall "Development Tools"',
  }
}
