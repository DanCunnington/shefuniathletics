# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
x = Admin.new(first_name: "Dan", email: "dcunnington1@sheffield.ac.uk", password: "password123",
				password_confirmation: "password123", super_admin: true)
x.save

y = Difficulty.new(grade: "Easy")
y.save

z = Difficulty.new(grade: "Medium")
z.save

a = Difficulty.new(grade: "Hard")
a.save