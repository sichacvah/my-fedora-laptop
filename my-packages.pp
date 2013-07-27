include developmenttools
include developmentlibraries
include cmake
include pythondevel

include tmux
include synergy
include skype
include chrome
include ctags
include phantomjs
include imagemagick

include rpmfusionrepos

# From puppetlabs/sqlite
class { 'sqlite': }
include sqlitelibs

# From puppetlabs/postgresql
include postgresql::server
include postgresqllibs

# MySQL stuff
# From puppetlabs/mysql
if $::operatingsystem == 'Fedora' and $::operatinsystemrelease >= 19 {
  # Declare the packages explicitly,
  # otherwise this will install mariadb for Fedora >= 19
  class { 'mysql':
    client_package_name => 'community-mysql',
    server_package_name => 'community-mysql-server'
  }
  class { 'mysql::ruby': }
  class { 'mysql::server': config_hash => { 'root_password' => 'mysql' } }
  # Also install developement package
  package { 'community-mysql-devel': }
} else {
  class { 'mysql': }
  class { 'mysql::ruby': }
  class { 'mysql::server': config_hash => { 'root_password' => 'mysql' } }
  # Also install developement package
  package { 'mysql-devel': }
}

include nokogiri

# Qt Toolkit Libs
include qtdevel
