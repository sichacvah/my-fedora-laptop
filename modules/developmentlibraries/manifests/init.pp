class developmentlibraries {
  # TODO: Improve this workaround
  exec { 'Development Libraries':
    unless  => '/usr/bin/yum grouplist "Development Libraries" | /bin/grep "^Installed Groups"',
    command => '/usr/bin/yum -y groupinstall "Development Libraries"',
  }
}
