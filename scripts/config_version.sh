#!/bin/bash

ruby_exe='ruby'
if [ -e /opt/puppetlabs/puppet/bin/ruby ]; then
  ruby_exe='/opt/puppetlabs/puppet/bin/ruby'
fi

if [ -e $1/$2/.r10k-deploy.json ]; then
  $ruby_exe $1/$2/scripts/code_manager_config_version.rb $1 $2
elif [ -e /opt/puppetlabs/server/pe_version ]; then 
  $ruby_exe $1/$2/scripts/config_version.rb $1 $2  
else
  /usr/bin/git --version > /dev/null 2>&1 &&
  /usr/bin/git --git-dir $1/$2/.git rev-parse HEAD ||
  date +%s
fi 
