# rails.spieksheet.rb

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
