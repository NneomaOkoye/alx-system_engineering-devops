# Elevate the ULIMIT value for the default file

exec {'adjust--for-nginx':
  command => 'sed -i"s/15/4096/" /etc/default/nginx',
  path => '/usr/local/bin/:/bin/'
} ->

# Reboot Nginx to apply changes
exec {'restart-nginx':
  command => 'nginx restart',
  path => '/etc/init.d/'
}
