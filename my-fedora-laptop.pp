include developmenttools
include developmentlibraries

include tmux
include synergy

include imagemagick

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
