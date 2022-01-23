# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create default admin user
User.create(username: 'admin', password: 'P@ssw0rd123', password_confirmation: 'P@ssw0rd123', name: 'Admin', role: 1)

# Create default colors
Color.create(hex: '#c03a3a')
Color.create(hex: '#ffc000')
Color.create(hex: '#1a8e17')
Color.create(hex: '#2f5496')
Color.create(hex: '#bd2db3')
Color.create(hex: '#000000')
Color.create(hex: '#33cccc')

