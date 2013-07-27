class rpmfusionrepos {
  $yum = "/usr/bin/yum"
  $rpm = "/usr/bin/rpm"

  $rpmfusionfree    = "rpmfusion-free-release-$(${rpm} -E %fedora).noarch.rpm"
  $rpmfusionnonfree = "rpmfusion-nonfree-release-$(${rpm} -E %fedora).noarch.rpm"

  exec { "${rpmfusionfree}":
    command => "${yum} localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/${rpmfusionfree}",
    unless  => "${rpm} -q ${rpmfusionfree}"
  }

  exec { "${rpmfusionnonfree}":
    command => "${yum} localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/${rpmfusionnonfree}",
    unless  => "${rpm} -q ${rpmfusionnonfree}"
  }
}
