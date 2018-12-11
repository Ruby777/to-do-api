# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

#Create Users
10.times do
    User.create do | user |
        user.username = Faker::Internet.email
        user.password_digest = Faker::Internet.password(10)
    end
end
users = User.all


#Create Lists
10.times do
    List.create do | list |
        list.name = Faker::Lorem.sentence
        list.user = users.sample
    end
end
lists = List.all

#Create Items
15.times do
    Item.create do | item |
        item.description = Faker::Lorem.paragraph
        item.list = lists.sample
    end
end

items = Item.all


puts "Seed Finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"