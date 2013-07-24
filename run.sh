#!/bin/bash

# Install Puppet if we haven't yet
rpm -q puppet || sudo yum install -y puppet

# Install SQLite module if we haven't yet
puppet module list --modulepath $(pwd)/modules | grep puppetlabs-sqlite || sudo puppet module install --modulepath $(pwd)/modules puppetlabs/sqlite

# Install PostgreSQL module if we haven't yet
puppet module list --modulepath $(pwd)/modules | grep puppetlabs-postgresql || sudo puppet module install --modulepath $(pwd)/modules puppetlabs/postgresql

# Install MySQL module if we haven't yet
puppet module list --modulepath $(pwd)/modules | grep puppetlabs-mysql || sudo puppet module install --modulepath $(pwd)/modules puppetlabs/mysql

# Install vcsrepo module if we haven't yet
puppet module list --modulepath $(pwd)/modules | grep puppetlabs-vcsrepo || sudo puppet module install --modulepath $(pwd)/modules puppetlabs/vcsrepo

# Finally execute my custom recipe
sudo puppet apply --modulepath $(pwd)/modules -v my-fedora-laptop.pp
