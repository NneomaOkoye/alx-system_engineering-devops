# let us start fixing the high request problems

exec {'adjust--for-nginx'::
  provider => shell,
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path => '/usr/local/bin/:/bin/'
} ->

exec { 'restart-nginx':
  provider => shell,
  command => 'nginx restart',
  path => '/etc/init.d/'
}
