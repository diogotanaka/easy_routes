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
User.destroy_all

# Criar usuário
user = User.create!(
  name: "João Silva",
  email: "joao@example.com"
)

# Criar trip
trip = user.trips.create!(
  origin: "São Paulo",
  destination: "Paris",
  start_date: Date.today + 30.days
)

# Criar mensagens
trip.messages.create!(role: "user", content: "Quais os melhores restaurantes?")
trip.messages.create!(role: "assistant", content: "Recomendo: Le Jules Verne e L'Ambroisie")

puts "✅ Dados criados com sucesso!"
