# frozen_string_literal: true

@pokemon.each do |pokemon|
  json.set! pokemon.id do
    json.id pokemon.id
    json.name pokemon.name
    json.image_url asset_path("pokemon_snaps/#{pokemon.image_url}")
  end
end
