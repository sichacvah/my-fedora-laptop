class skype {
  package { 'skype':
    provider => 'rpm',
    source   => 'http://www.skype.com/go/getskype-linux-beta-fc10',
    ensure   => installed,
  }
}
