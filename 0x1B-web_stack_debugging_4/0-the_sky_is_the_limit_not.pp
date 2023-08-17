# let us start fixing the high request problems

exec {'replace':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  before   => Exec['restart'],
}
# ngnix restarting
exec {'restart':
  provider => shell,
  command  => 'sudo service ngnix restart',
}
