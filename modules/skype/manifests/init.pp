class skype {
  package { 'alsa-lib.i686': }
  package { 'fontconfig.i686': }
  package { 'freetype.i686': }
  package { 'glib2.i686': }
  package { 'libSM.i686': }
  package { 'libXScrnSaver.i686': }
  package { 'libXi.i686': }
  package { 'libXrandr.i686': }
  package { 'libXrender.i686': }
  package { 'libXv.i686': }
  package { 'libstdc++.i686': }
  package { 'pulseaudio-libs.i686': }
  package { 'qt.i686': }
  package { 'qt-x11.i686': }
  package { 'zlib.i686': }

  package { 'skype':
    provider => 'rpm',
    source   => 'http://www.skype.com/go/getskype-linux-beta-fc10',
    ensure   => installed,
    require  => Package[
      'alsa-lib',
      'fontconfig',
      'freetype',
      'glib2',
      'libSM',
      'libXScrnSaver',
      'libXi',
      'libXrandr',
      'libXrender',
      'libXv',
      'libstdc++',
      'pulseaudio-libs',
      'qt',
      'qt-x11',
      'zlib'
    ],
  }
}
