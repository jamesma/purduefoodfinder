# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_roles
  puts 'CREATING ROLES'

  Role.create([
    { name: 'admin' }, 
    { name: 'user' }
  ], without_protection: true)
end

def create_users
  puts 'CREATING USERS'

  admin = User.create!(
    name: 'Administrator',
    email: 'admin@purdue.edu',
    password: 'foobar',
    password_confirmation: 'foobar')

  admin.add_role :admin
  puts 'Admin created: ' << admin.email

  49.times do |n|
    name = Faker::Name.name
    email = "user#{n+1}@purdue.edu"
    password = 'foobar'
    user = User.create!(
      name: name,
      email: email,
      password: password,
      password_confirmation: password)
    user.add_role :user
  end
end

def create_events
  puts 'CREATING EVENTS'

  users = User.all(limit: 10)
  5.times do
    users.each do |user|
      name = Faker::Name.title
      details = Faker::Lorem.paragraph
      address = Faker::Address.street_name
      source = Faker::Internet.url
      category = Faker::Address.state
      date = rand(5.months).ago
      time = rand(50.minutes).ago
      user.events.create!(
        name: name,
        details: details,
        where: address,
        source: source,
        category: category,
        whendate: date,
        whentime: time)
    end
  end
end



create_users
create_events