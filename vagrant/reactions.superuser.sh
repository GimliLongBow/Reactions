# Referenced from here: https://github.com/fschwiet/helloVagrant

# Install Everything
apt-get update >/dev/null 2>&1

if command -v aptitude >/dev/null 2>&1 ; then
  pm="aptitude"
else
  pm="apt-get"
fi

echo -e "\nUsing $pm for package installation\n"

# Install build tools
echo -e "\n=> Installing build tools..."
$pm -y install \
    wget curl build-essential clang \
    bison zlib1g \
    libxslt1.1 libssl-dev libxslt1-dev \
    libxml2 libffi-dev libyaml-dev \
    libxslt-dev autoconf libc6-dev \
    libreadline6-dev zlib1g-dev libcurl4-openssl-dev \
    libtool 2>&1
echo "==> done..."

echo -e "\n=> Installing libs needed for sqlite and mysql..."
$pm -y install libsqlite3-0 sqlite3 libsqlite3-dev libmysqlclient-dev 2>&1
echo "==> done..."

# Install git-core
echo -e "\n=> Installing git..."
$pm -y install git-core 2>&1
echo "==> done..."

# Install apache & mysql:
$pm -y install apache2 \
    apache2-threaded-dev \
    libapr1-dev \
    libaprutil1-dev \
    mysql-client 2>&1

# Link up the shared folder. 
rm -rf /var/www
ln -fs /vagrant /var/www

# Configure vhost:
cat << EOF > /etc/apache2/sites-available/reactions.dev

<VirtualHost *:80>
	ServerAdmin andrew@websitesthatdostuff.com
  
  ServerName www.reactions.dev
  DocumentRoot /var/www/public
	<Directory /var/www/>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>

</VirtualHost>

EOF

# Configure passenger:
cat << EOF > /etc/apache2/mods-available/passenger.load

LoadModule passenger_module /home/vagrant/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/passenger-4.0.48/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /home/vagrant/.rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/gems/passenger-4.0.48
  PassengerDefaultRuby /home/vagrant/.rbenv/versions/2.1.0/bin/ruby
</IfModule>

EOF

# TODO: Set up MySQL