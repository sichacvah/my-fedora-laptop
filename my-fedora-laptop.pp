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

# From puppetlabs/sqlite
class { 'sqlite': }
include sqlitelibs

# From puppetlabs/postgresql
include postgresql::server
include postgresqllibs

# MySQL stuff
# From puppetlabs/mysql
class { 'mysql': }
class { 'mysql::ruby': }
class { 'mysql::server': config_hash => { 'root_password' => '' } }

include nokogiri

# Qt Toolkit Libs
include qtdevel
