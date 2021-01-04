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

> sudo -u postgres psql -l
                                       List of databases
      Name       |     Owner     | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------------+---------------+----------+-------------+-------------+-----------------------
 db_dnsman_dev   | dnsmanuser    | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 db_dnsman_pro   | dnsmanuser    | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 db_dnsman_tst   | dnsmanuser    | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 db_netadmin_dev | netadmin_user | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 db_netadmin_pro | netadmin_user | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 db_netadmin_tst | netadmin_user | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 postgres        | postgres      | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 template0       | postgres      | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                 |               |          |             |             | postgres=CTc/postgres
 template1       | postgres      | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                 |               |          |             |             | postgres=CTc/postgres
(9 rows)

# https://www.postgresql.org/docs/11/app-pgdump.html


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
# add Associations via Migrations

# add reference:port to switch :
#
# > bin/rails generate migration AddRefPortToSwitch
invoke  active_record
create    db/migrate/20201201214847_add_ref_port_to_switch.rb
#
# > cat db/migrate/20201201214847_add_ref_port_to_switch.rb 
class AddRefPortToSwitch < ActiveRecord::Migration[5.2]
  def change
    change_table :ports do |t|
      t.belongs_to :switch, index: true
    end
  end
end
#
# > cat app/models/switch.rb 
class Switch < ApplicationRecord
  has_many :ports
end
#
# > cat app/models/port.rb 
class Port < ApplicationRecord
  belongs_to :switch    # creates 'switch_id' FK in 'Port' DB:Table
end
#
# > cat db/seeds.rb 
(1..3).each do |s|
  new_swith = Switch.create do |switch|
    switch.name = "switch#{s}"
  end
  (1..24).each do |p|
    Port.create do |port|
      port.name = "port#{s}/#{p}"
      port.switch = new_swith
    end
  end
end
#

# https://guides.rubyonrails.org/v5.2/association_basics.html#the-has-many-association
#
class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.datetime   :published_at
      t.string     :book_number
      t.references :author
    end
  end
end
#
# Whereas for an existing table, it might look like this:
class AddAuthorToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :author
  end
end
#

# Active Record supports automatic identification for most associations with standard names. 
# However, Active Record will not automatically identify bi-directional associations that contain a scope or any of the following options:
#  :through
#  :foreign_key
#
# Fix with 'inverse_of'
#
class Author < ApplicationRecord
  has_many :books, inverse_of: 'writer'
end
# 
class Book < ApplicationRecord
  belongs_to :writer, class_name: 'Author', foreign_key: 'author_id'
end
#
# By including the :inverse_of option in the has_many association declaration, Active Record will now recognize the bi-directional association:
a = Author.first
b = a.books.first
a.first_name == b.writer.first_name # => true
a.first_name = 'David'
a.first_name == b.writer.first_name # => true
#

# If you set the :touch option to true, then the updated_at or updated_on timestamp on the associated object will be set to the current time whenever this object is saved or destroyed:
#
class Book < ApplicationRecord
  belongs_to :author, touch: true
end
#
class Author < ApplicationRecord
  has_many :books
end
#

# If you set the :optional option to true, then the presence of the associated object won't be validated. By default, this option is set to false.
# 
class Port < ApplicationRecord
  belongs_to :switch, optional: true  # default is false
end
#
# test using .nil? :
if @port.switch.nil?
  @msg = "No switch found for this port"
end
#

# The collection.empty? method returns true if the collection does not contain any associated objects.
<% if @author.books.empty? %>
  No Books Found
<% end %>
#

# The enum macro maps an integer column to a set of possible values.
#
class Book < ApplicationRecord
  enum availability: [:available, :unavailable]
end
#
# This will automatically create the corresponding scopes to query the model. Methods to transition between states and query the current state are also added.
# Both examples below query just available books.
Book.available
# or
Book.where(availability: :available)
#
book = Book.new(availability: :available)
book.available?   # => true
book.unavailable! # => true
book.available?   # => false
#

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
#
bin/rake db:schema:load   # delete db contents and rebuild using migrations (but does not 'drop' + 'create' )

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
