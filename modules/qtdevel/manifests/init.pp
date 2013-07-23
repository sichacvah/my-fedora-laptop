class qtdevel {
  package { 'qtwebkit-devel': ensure => installed }
  exec { "Create symlink from qmake to `which qmake-qt4`":
    unless => "/usr/bin/which qmake",
    command => "/usr/bin/ln -s `/usr/bin/which qmake-qt4` /usr/bin/qmake",
  }
}
