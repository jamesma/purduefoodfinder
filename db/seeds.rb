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

  admin = User.new(
    name: 'Administrator',
    email: 'admin@purdue.edu',
    password: ENV['SEED_ADMIN_PASSWORD'],
    password_confirmation: ENV['SEED_ADMIN_PASSWORD'])
  admin.skip_confirmation!
  admin.add_role :admin
  admin.save!
  puts 'Admin created and confirmed: ' << admin.email

  49.times do |n|
    name = Faker::Name.name
    email = "user#{n+1}@purdue.edu"
    password = ENV['SEED_USER_PASSWORD']
    user = User.new(
      name: name,
      email: email,
      password: password,
      password_confirmation: password)
    user.skip_confirmation!
    user.add_role :user
    user.save!
  end
end

def create_events
  puts 'CREATING EVENTS'

  users = User.all(limit: 10)
  5.times do
    users.each do |user|
      name = Faker::Company.name
      details = Faker::Company.catch_phrase
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