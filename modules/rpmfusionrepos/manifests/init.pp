class rpmfusionrepos {
  $yum = "/usr/bin/yum"
  $rpm = "/usr/bin/rpm"

  $rpmfusionfree    = "rpmfusion-free-release-$(${rpm} -E %fedora).noarch"
  $rpmfusionnonfree = "rpmfusion-nonfree-release-$(${rpm} -E %fedora).noarch"

  exec { "${rpmfusionfree}":
    command => "${yum} localinstall -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/${rpmfusionfree}.rpm",
    unless  => "${rpm} -q ${rpmfusionfree}"
  }

  exec { "${rpmfusionnonfree}":
    command => "${yum} localinstall -y --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/${rpmfusionnonfree}.rpm",
    unless  => "${rpm} -q ${rpmfusionnonfree}"
  }
}
