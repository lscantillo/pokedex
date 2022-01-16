# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'httparty'

response = HTTParty.get("https://pokeapi.co/api/v2/pokemon?offset=100&limit=10")
response['results'].each do |poke|
  pokemon_data = HTTParty.get(poke['url'])
  pokemon = Pokemon.new
  pokemon.name = pokemon_data['name']
  pokemon.pokemon_id = pokemon_data['id']
  pokemon.image_url = pokemon_data['sprites']['front_default']
  pokemon.pokemon_type = pokemon_data['types'].map { |types| types['type']['name']}.join(',')
  Pokemon.transaction do
    pokemon.save!
  end
end
