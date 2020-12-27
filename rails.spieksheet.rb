# rails.spieksheet.rb

# - - - - - - + + + - - - - - - 

# https://rubyonrails.org/
# https://guides.rubyonrails.org/v5.2/
# https://guides.rubyonrails.org/v5.2/active_record_migrations.html

# - - - - - - + + + - - - - - - 
# Create Project

> cd /home/jdg/dev/netadmin-ruby
> rm -rf NetAdmin
> rails new NetAdmin --database=postgresql --skip-git
> cd NetAdmin

# - - - - - - + + + - - - - - - 
# Prepare DB

> vi config/database.yml
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  encoding: UTF-8
  host: localhost
development:
  <<: *default
  database: db_netadmin_dev
  username: netadmin_user
  password: mypwd
test:
  <<: *default
  database: db_netadmin_tst
  username: netadmin_user
  password: mypwd
production:
  <<: *default
  database: db_netadmin_pro
  username: netadmin_user
  password: mypwd

# - - - - - - + + + - - - - - - 
# Create Project (manual)

> sudo -u postgres -i
dropdb db_netadmin_dev
dropdb db_netadmin_tst
dropdb db_netadmin_pro
# > createuser --pwprompt netadmin_user
# # pwd: mypwd
createdb -O netadmin_user db_netadmin_dev
createdb -O netadmin_user db_netadmin_tst
createdb -O netadmin_user db_netadmin_pro
#
> psql  # (do we need this?)
postgres=#> grant all privileges on database db_netadmin_dev to netadmin_user;
postgres=#> grant all privileges on database db_netadmin_tst to netadmin_user;
postgres=#> grant all privileges on database db_netadmin_pro to netadmin_user;
#
> psql -d db_netadmin_dev -h localhost -U netadmin_user
> psql -d db_netadmin_tst -h localhost -U netadmin_user
> psql -d db_netadmin_pro -h localhost -U netadmin_user

# - - - - - - + + + - - - - - - 
# Create Models (and Controllers/Views)

# now generate models/tables with no references yet, will add them in migrate-file and model in one-go, then migrate:
rails generate scaffold switch name:string mytype:string ipaddress:string nrports:integer
rails generate scaffold port name:string mytype:string 
rails generate scaffold link name:string mytype:string 
rails generate scaffold path name:string mytype:string 
rails generate scaffold service name:string mytype:string 
rails generate scaffold customer name:string mytype:string 
rails generate scaffold provider name:string mytype:string 
rails generate scaffold location name:string mytype:string 
rails db:migrate

# - - - - - - + + + - - - - - - 
# ActiveRecord:DB setup

# https://guides.rubyonrails.org/v5.2/active_record_migrations.html
# https://stackify.com/rails-migration-a-complete-guide/
# https://gist.github.com/harrietty/92c5da9505b503e40a16ae52fed0c8ca
#
bin/rails db:setup
bin/rails db:drop
bin/rails db:reset # equivalent to: bin/rails db:drop db:setup
#
bin/rails db:migrate
bin/rails db:migrate VERSION=20080906120000
bin/rails db:migrate RAILS_ENV=test # default = development
bin/rails db:migrate:status 
bin/rails db:version
bin/rails db:rollback
#
bin/rails db:seed

# - - - - - - + + + - - - - - - 
# Drifting Ruby: Episode #127 - ActiveRecord Tricks
# https://www.youtube.com/watch?v=1ZkwvPMiq4Q&t=30s

# > vi db/seed.rb
#
Status.create(name: "Active", active: true)
Status.create(name: "Inactive", active: false)
#
20.times do 
  User.create do |user|
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.email = Fakker::Internet.email
    user.status = Status.all.sample
  end
end
#
100.times do 
  Message.create do |message|
    message.user = User.all.sample
    message.content = Faker::Lorem.paragraph
    message.read = [true, false].sample
  end
end
#


# - - - - - - + + + - - - - - - 
