#!/bin/bash
apt update && apt install apache2 php -y
rm /var/www/html/index.html

cat << EOT > /var/www/html/index.php
<?php
header('Content-Type: application/json');
\$data = array(
  'msg' => 'Hello world!',
  "server" => php_uname('n')
);
echo json_encode(\$data);
EOT
