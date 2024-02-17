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

Player.destroy_all
User.destroy_all

puts "----------------------------------------------------------------"
puts "Records being destroyed"
puts "----------------------------------------------------------------"

puts "----------------------------------------------------------------"
puts "Creating users..."
puts "----------------------------------------------------------------"

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

puts "----------------------------------------------------------------"
puts "#{User.count} Users created"
puts "----------------------------------------------------------------"

puts "----------------------------------------------------------------"
puts "Creating players..."
puts "----------------------------------------------------------------"

#The code below is used to later change the nationality result in a compatible string format
# string = "[\"Brazil\", \"Argentina\"]"
# countries = JSON.parse(string).join(', ')
# Player.all.each do |player|
#   player.nationality = JSON.parse(player.nationality).join(', ')
# end

puts "----------------------------------------------------------------"
puts "Creating players of liverpool"
puts "----------------------------------------------------------------"

url_liverpool = 'https://transfermarkt-api.vercel.app/clubs/31/players'
uri = URI(url_liverpool)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
players = data['players']

players.each do |player|
  if player['marketValue'].present?
    Player.create(
      id: player['id'],
      name: player['name'],
      position: player['position'],
      age: player['age'],
      nationality: JSON.parse(player['nationality'].to_s).join(', '),
      height: player['height'],
      foot: player['foot'],
      club: 'Liverpool',
      market_value: player['marketValue'].delete('^.0-9').to_i * 1000000,
      price_per_day: player['marketValue'].delete('^.0-9').to_i * 1000000 / 365,
      owner_id: julien[:id],
      photo: ''
    )
  else
    Player.create(
      id: player['id'],
      name: player['name'],
      position: player['position'],
      age: player['age'],
      nationality: JSON.parse(player['nationality'].to_s).join(', '),
      height: player['height'],
      foot: player['foot'],
      club: 'Liverpool',
      market_value: 0,
      price_per_day: 0,
      owner_id: julien[:id],
      photo: ''
    )
  end
end

puts "----------------------------------------------------------------"
puts "Creating players of lisboa"
puts "----------------------------------------------------------------"

url_lisboa = 'https://transfermarkt-api.vercel.app/clubs/294/players'
uri = URI(url_lisboa)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
players = data['players']

players.each do |player|
  if player['marketValue'].present?
    Player.create(
      id: player['id'],
      name: player['name'],
      position: player['position'],
      age: player['age'],
      nationality: JSON.parse(player['nationality'].to_s).join(', '),
      height: player['height'],
      foot: player['foot'],
      club: 'Benfica Lisbonne',
      market_value: player['marketValue'].delete('^.0-9').to_i * 1000000,
      price_per_day: player['marketValue'].delete('^.0-9').to_i * 1000000 / 365,
      owner_id: ricardo[:id],
      photo: ''
    )
  else
    Player.create(
      id: player['id'],
      name: player['name'],
      position: player['position'],
      age: player['age'],
      nationality: JSON.parse(player['nationality'].to_s).join(', '),
      height: player['height'],
      foot: player['foot'],
      club: 'Benfica Lisbonne',
      market_value: 0,
      price_per_day: 0,
      owner_id: ricardo[:id],
      photo: ''
    )
  end
end

puts "----------------------------------------------------------------"
puts "Creating players of juventus"
puts "----------------------------------------------------------------"

url_juventus = 'https://transfermarkt-api.vercel.app/clubs/506/players'
uri = URI(url_juventus)
response = Net::HTTP.get(uri)
data = JSON.parse(response)
players = data['players']

players.each do |player|
  if player['marketValue'].present?
    Player.create(
      id: player['id'],
      name: player['name'],
      position: player['position'],
      age: player['age'],
      nationality: JSON.parse(player['nationality'].to_s).join(', '),
      height: player['height'],
      foot: player['foot'],
      club: 'Juventus',
      market_value: player['marketValue'].delete('^.0-9').to_i * 1000000,
      price_per_day: player['marketValue'].delete('^.0-9').to_i * 1000000 / 365,
      owner_id: albert[:id],
      photo: ''
    )
  else
    Player.create(
      id: player['id'],
      name: player['name'],
      position: player['position'],
      age: player['age'],
      nationality: JSON.parse(player['nationality'].to_s).join(', '),
      height: player['height'],
      foot: player['foot'],
      club: 'Juventus',
      market_value: 0,
      price_per_day: 0,
      owner_id: albert[:id],
      photo: ''
    )
  end
end

players_created = Player.all
players_created.each do |player|
  puts "Adding photo to #{player.name}"
  url_photos = "https://transfermarkt-api.vercel.app/players/#{player.id}/profile"
  uri_photos = URI(url_photos)
  photos = Net::HTTP.get(uri_photos)
  data_photos = JSON.parse(photos)
  players_photo = data_photos['imageURL']
  player.update(img: players_photo)
  puts "Photo added to #{player.name}"
end

puts "----------------------------------------------------------------"
puts "#{Player.count} players creeated"
puts "----------------------------------------------------------------"

puts "Seed done"
