#!/bin/bash


rpm -q puppet || sudo yum install -y puppet
sudo puppet module install --modulepath $(pwd)/modules puppetlabs/postgresql
sudo puppet apply --modulepath $(pwd)/modules -v my-fedora-laptop.pp
