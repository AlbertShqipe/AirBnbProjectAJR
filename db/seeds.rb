# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'net/http'
require 'json'

puts "Records being destroyed"

puts "----------------------------------------------------------------"
puts "----------------------------------------------------------------"

puts "Creating users..."

albert = User.create(
  first_name: 'Albert',
  last_name: 'Nikolli',
  email: 'sarabanda.sarab@gmail.com',
  password: 'azerty1234'
)

julien = User.create(
  first_name: 'Julien',
  last_name: 'Marchand',
  email: 'liverpool.liver@gmail.com',
  password: 'azerty1234'
)

ricardo = User.create(
  first_name: 'Ricardo',
  last_name: 'Canas',
  email: 'benfica.benfi@gmail.com',
  password: 'azerty1234'
)

puts "Users created"

puts "----------------------------------------------------------------"
puts "----------------------------------------------------------------"

puts "Creating new players"

#The code below is used to later change the nationality result in a compatible string format
# string = "[\"Brazil\", \"Argentina\"]"
# countries = JSON.parse(string).join(', ')
# Player.all.each do |player|
#   player.nationality = JSON.parse(player.nationality).join(', ')
# end

url_liverpool = 'https://transfermarkt-api.vercel.app/clubs/31/players'
uri = URI(url_liverpool)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
players = data['players']

players.each do |player|
  if player['marketValue'].present?
    Player.create(
    name: player['name'],
    position: player['position'],
    age: player['age'],
    nationality: JSON.parse(player['nationality'].to_s).join(', '),
    height: player['height'],
    foot: player['foot'],
    club: player['signedFrom'],
    market_value: player['marketValue'].delete('^.0-9').to_i * 1000000,
    price_per_day: player['marketValue'].delete('^.0-9').to_i * 1000000 / 365,
    owner_id: julien[:id]
    )
  else
    Player.create(
    name: player['name'],
    position: player['position'],
    age: player['age'],
    nationality: JSON.parse(player['nationality'].to_s).join(', '),
    height: player['height'],
    foot: player['foot'],
    club: player['signedFrom'],
    market_value: 0,
    price_per_day: 0,
    owner_id: julien[:id]
    )
  end
end

puts "Creating players of lisboa"

url_lisboa = 'https://transfermarkt-api.vercel.app/clubs/294/players'
uri = URI(url_lisboa)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
players = data['players']

players.each do |player|
  if player['marketValue'].present?
    Player.create(
    name: player['name'],
    position: player['position'],
    age: player['age'],
    nationality: JSON.parse(player['nationality'].to_s).join(', '),
    height: player['height'],
    foot: player['foot'],
    club: player['signedFrom'],
    market_value: player['marketValue'].delete('^.0-9').to_i * 1000000,
    price_per_day: player['marketValue'].delete('^.0-9').to_i * 1000000 / 365,
    owner_id: ricardo[:id]
    )
  else
    Player.create(
    name: player['name'],
    position: player['position'],
    age: player['age'],
    nationality: JSON.parse(player['nationality'].to_s).join(', '),
    height: player['height'],
    foot: player['foot'],
    club: player['signedFrom'],
    market_value: 0,
    price_per_day: 0,
    owner_id: ricardo[:id]
    )
  end
end

puts "Creating players of juventus"

url_juventus = 'https://transfermarkt-api.vercel.app/clubs/506/players'
uri = URI(url_juventus)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
players = data['players']

players.each do |player|
  if player['marketValue'].present?
    Player.create(
    name: player['name'],
    position: player['position'],
    age: player['age'],
    nationality: JSON.parse(player['nationality'].to_s).join(', '),
    height: player['height'],
    foot: player['foot'],
    club: player['signedFrom'],
    market_value: player['marketValue'].delete('^.0-9').to_i * 1000000,
    price_per_day: player['marketValue'].delete('^.0-9').to_i * 1000000 / 365,
    owner_id: albert[:id]
    )
  else
    Player.create(
    name: player['name'],
    position: player['position'],
    age: player['age'],
    nationality: JSON.parse(player['nationality'].to_s).join(', '),
    height: player['height'],
    foot: player['foot'],
    club: player['signedFrom'],
    market_value: 0,
    price_per_day: 0,
    owner_id: albert[:id]
    )
  end
end

puts "Players created"
