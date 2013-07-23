class chrome {
  package { 'google-chrome-stable':
    provider => 'rpm',
    source   => 'https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm',
    ensure   => installed,
  }
}
