# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'CREATING ROLES'

Role.create([
  { :name => 'admin' }, 
  { :name => 'user' }, 
  { :name => 'VIP' }
], :without_protection => true)

puts 'SETTING UP DEFAULT USER LOGIN'

admin = User.create! :name => 'Administrator', :email => 'ma23@purdue.edu', :password => 'foobar', :password_confirmation => 'foobar'
admin.add_role :admin
puts 'Admin created: ' << admin.name

user = User.create! :name => 'First User', :email => 'user1@purdue.edu', :password => 'foobar', :password_confirmation => 'foobar'
user.add_role :user
puts 'New user created: ' << user.name

user2 = User.create! :name => 'Second User', :email => 'user2@purdue.edu', :password => 'foobar', :password_confirmation => 'foobar'
user2.add_role :user
puts 'New user created: ' << user2.name