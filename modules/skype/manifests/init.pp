class skype {
  package { 'alsa-lib': }
  package { 'fontconfig': }
  package { 'freetype': }
  package { 'glib2': }
  package { 'libSM': }
  package { 'libXScrnSaver': }
  package { 'libXi': }
  package { 'libXrandr': }
  package { 'libXrender': }
  package { 'libXv': }
  package { 'libstdc++': }
  package { 'pulseaudio-libs': }
  package { 'qt': }
  package { 'qt-x11': }
  package { 'zlib': }

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
