echo "This is the Student Union System installation tool."
echo "Created by Chung Chun Wang, 2023."
echo "This script is licensed under the MIT License, and is provided as-is, with no warranty."
echo "======================================================================================="
echo "This installation tool includes both a setup script and an SSL certificate update script."
echo "While automatic SSL certificate renewal is supported by certbot, this script does not make use of it as the site may not be hosted on port 80 (which is required to be open for the renewal to work)."
echo "Therefore, you will need to run the SSL certificate update script manually every 90 days."
echo "Alternately, if your site runs on port 80 and are familiar with certbot, run "sudo certbot certonly \-\-nginx" to enable auto renewal."
echo "======================================================================================="
echo "NOTE: Before you run this script, you will need to have setup a domain name and pointed it to this server."
echo "Please provide the domain name you have setup. (e.g. nhks-su.com, site.nhks-su.com, without http:// or https://)"
#Read domain name into variable
read -p "Domain name: " domainname
echo "You have entered $domainname as your domain name."
echo "======================================================================================="
echo "What operation do you wish to perform:"
echo "1. Setup Student Union System"
echo "2. Update SSL certificates"

read -p "Enter your choice: " -n 1 -r
echo #newline
if [[ ! $REPLY =~ ^[1-2]$ ]]
then
    echo "Invalid choice. Exiting."
    exit 1
fi
# choice 2
if [[ $REPLY =~ ^[2]$ ]]
then
    echo "This script will update SSL certificates for your domain."
    echo "It will also restart the nginx server."
    read -p "Do you want to continue? (y/n)" -n 1 -r
    echo #newline
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
    certbot -d $domainname --manual --preferred-challenges dns certonly
    sudo systemctl restart nginx
    exit 0
fi

#print info about setup process
echo "This script will setup https://github.com/chungchunwang/Student-Union-System."
echo "It will install docker, docker-compose, mysql, nginx, budibase, as well as other necessary tools."
echo "It will also setup these tools to begin hosting."
echo "In a later step, you will setup SSL certificates for your domain."
#ask for input to continue
read -p "Do you want to continue? (y/n)" -n 1 -r
echo #newline
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
echo "What port do you wish to host the server on? Make sure that this port is open on your server."
read -p "Port: " port
echo "You have entered $port as your port."
echo "What password do you wish to use for the MySQL root user?"
read -p "Password: " mysqlpassword
echo "You have entered $mysqlpassword as your MySQL root password."
echo "======================================================================================="
echo "This script will now begin the setup process."
echo "Please note that this script will take a while to complete."
echo "Note: Keep the port for the Budibase server as 10000, the default. Nginx will reverse proxy to this port."
echo "======================================================================================="
read -p "Press any key to continue..." -n 1 -r
echo #newline

cd ~ #go to home directory

#install tools
snap install certbot --classic
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
curl -SL https://github.com/docker/compose/releases/download/v2.17.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - 
sudo apt-get install -y nodejs
sudo apt-get install -y gcc g++ make
wget https://github.com/Budibase/budibase/releases/download/v2.4.4/cli-linux
chmod +x cli-linux
sudo mv cli-linux /usr/bin/budi
sudo apt-get install -y nginx

#setup nginx
sudo ufw allow 'Nginx Full'
cat <<EOT >> /etc/nginx/sites-available/$domainname
server {
    listen $port ssl;
    ssl_certificate /etc/letsencrypt/live/$domainname/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$domainname/privkey.pem;
    ssl_protocols TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers EECDH+AESGCM:EDH+AESGCM;
    ssl_ecdh_curve secp384r1;
    ssl_session_timeout  10m;
    ssl_session_cache shared:SSL:10m;
    ssl_session_tickets off;
    ssl_stapling on;
    ssl_stapling_verify on;
    resolver 8.8.8.8 8.8.4.4 valid=300s;
    resolver_timeout 5s;

    server_name $domainname;

    error_page 497 301 =307 https://\$host:\$server_port\$request_uri;

    location / {
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header Host \$http_host;
        proxy_http_version 1.1;
        proxy_pass http://localhost:10000;
    }

    client_max_body_size 1000m;
}
EOT
cat <<EOT > /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {
        proxy_connect_timeout       3600;
        proxy_send_timeout          3600;
        proxy_read_timeout          3600;
        send_timeout                3600;
        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}


#mail {
#       # See sample authentication script at:
#       # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
#
#       # auth_http localhost/auth.php;
#       # pop3_capabilities "TOP" "USER";
#       # imap_capabilities "IMAP4rev1" "UIDPLUS";
#
#       server {
#               listen     localhost:110;
#               protocol   pop3;
#               proxy      on;
#       }
#
#       server {
#               listen     localhost:143;
#               protocol   imap;
#               proxy      on;
#       }
#}
EOT
sudo ln -s /etc/nginx/sites-available/$domainname /etc/nginx/sites-enabled/
sudo systemctl restart nginx

#setup mySQL server
cd ~ #go to home directory
mkdir mysql
cd mysql
cat <<EOT >> ./docker-compose.yml
version: '3.3'
services:
  SUMySQL:
    image: mysql:latest
    command: --max_allowed_packet=1073741824
    restart: always
    environment:
      # Password for root access
      MYSQL_ROOT_PASSWORD: '$mysqlpassword'
    ports:
      # <Port exposed> : < MySQL Port running inside container>
      - '3306:3306'
    expose:
      # Opens port 3306 on the container
      - '3306'
      # Where our data will be persisted
    volumes:
      - SUMySQL:/var/lib/mysql
# Names our volume
volumes:
  SUMySQL:
EOT
docker-compose up -d

#setup budibase
cd ~ #go to home directory
mkdir budibase
cd budibase
cat <<EOT >> ./docker-compose.yaml
version: "3"
services:
  budibase:
    restart: unless-stopped
    image: budibase/budibase:v2.1.42
    ports:
      - 10000:80
    environment:
      JWT_SECRET: $(openssl rand -base64 12)
      MINIO_ACCESS_KEY: $(openssl rand -base64 12)
      MINIO_SECRET_KEY: $(openssl rand -base64 12)
      REDIS_PASSWORD: $(openssl rand -base64 12)
      INTERNAL_API_KEY: $(openssl rand -base64 12)
      COUCHDB_USER: admin
      COUCHDB_PASSWORD: $(openssl rand -base64 12)
    volumes:
      - budibase_data:/data
volumes:
  budibase_data:
    driver: local
EOT
budi hosting --start

#setup SSL certificates
snap install certbot --classic
certbot -d $domainname --manual --preferred-challenges dns certonly
sudo systemctl restart nginx

#finish message
echo "Setup complete. Please consult the manual for further configuration instructions."
