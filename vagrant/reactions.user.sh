cd ~
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
echo 'eval "$(rbenv init -)"' >> ~/.profile
. ~/.profile

cd /var/www
rbenv install
gem install bundler
gem install passenger -v 4.0.48
. ~/.profile

# Install Passenger:
passenger-install-apache2-module --auto --languages 'ruby'

sudo a2dissite 000-default
sudo a2ensite reactions.dev
sudo a2enmod passenger
sudo apachectl restart

# Install the necessities.
rbenv rehash
bundle