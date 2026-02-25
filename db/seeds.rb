# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
# User.destroy_all

# 2. Create the instances 🏗️
puts "Creating users..."
User.create!(email: "diogo@diogo.com", password: "teste1", first_name: "Diogo", last_name: "Tanaka", preferred_method: "Subway", accessibility: false)
puts "Created Dishoom",
puts "Created Pizza East"

# 3. Display a message 🎉
puts "Finished! Created #{User.count} user."
