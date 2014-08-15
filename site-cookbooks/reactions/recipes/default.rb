include_recipe "apache2"

web_app "my_site" do
  server_name "reactions.dev"
  server_aliases ["www.reactions.dev"]
  docroot "/vagrant/public"
end

# Set up rbenv
=begin
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

rbenv_ruby "2.1.2"

rbenv_gem "bundler" do
  ruby_version "2.1.2"
end
=end
