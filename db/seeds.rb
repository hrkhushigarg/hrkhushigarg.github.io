# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts 'Seed: Deleting existing files...'

Work.destroy_all
User.destroy_all

puts 'Seed: Creating Users...'

User.create!(email: "dianaspieser@gmail.com", password: "password", admin: true)
User.create!(email: "evgenia_manolova@yahoo.com", password: "password", admin: true)

puts 'Seed: Users created...'

puts 'Seed: Creating Work...'

feedback = Work.create!(name: "Feedback", description: "Your feedback")
puts 'Seed: Work created...'

puts 'Seed: End All Good...'
