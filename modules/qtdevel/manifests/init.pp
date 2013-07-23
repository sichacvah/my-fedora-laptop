class qtdevel {
  package { 'qt-devel': ensure => installed }
  package { 'qtwebkit-devel': ensure => installed }

  file { "/usr/bin/qmake":
    target  => "/usr/bin/qmake-qt4",
    ensure  => link,
    require => Package["qt-devel"],
  }
}
