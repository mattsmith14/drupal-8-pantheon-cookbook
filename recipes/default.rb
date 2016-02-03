#
# Cookbook Name:: drupal-8
# Recipe:: default
#
#

include_recipe 'apt::default'


#Install MySQL
mysql_service 'mysql' do
  port node['drupal-8']['database_connection']['port']
  initial_root_password node['drupal-8']['database_connection']['password']
  action [:create, :start]
end

mysql2_chef_gem 'default' do
  action :install
end

# Create a database to use
mysql_database 'drupal8' do
  connection(
    :host     => '127.0.0.1',
    :username => 'root',
    :password => node['drupal-8']['database_connection']['password']
  )
  action :create
end

# Setup apache
web_app 'drupal_app' do
  template 'vhost.conf.erb'
  docroot '/var/www'
end

# Setup php
include_recipe 'apache2::mod_php5'

# Install composer
execute 'install composer' do
  command 'curl -sS https://getcomposer.org/installer | php'
end

execute 'move composer' do
  command 'mv composer.phar /usr/local/bin/composer'
end

# Put the global packages in the right spot
ENV['COMPOSER_HOME'] = '/home/vagrant/.composer'

# Install drush
execute 'install drush' do
  command 'composer global require drush/drush'
end

# Install pantheon-cli (terminus)
execute 'install pantheon-cli (terminus)' do
  command 'composer global require pantheon-systems/cli'
  action :run
end

template '/home/vagrant/.bashrc' do
  source 'bashrc'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end


