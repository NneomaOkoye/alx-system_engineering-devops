# let us start fixing the high request problems

file {'replace':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  before   => Exec['restart'],
}

service {'restart':
  provider => shell,
  command  => 'sudo service ngnix restart',
}
