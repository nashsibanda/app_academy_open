# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

benches = Api::Bench.create([
  { description: 'A nice neighbourhood park bench', lat: 36.364169, lng: 140.488767 },
  { description: 'Lovely views of the Bizen canal', lat: 36.363387, lng: 140.490715 },
  { description: "Xena's favourite spot to hang out", lat: 36.368663, lng: 140.493656 },
  { description: 'A great spot to check out the buskers', lat: 36.369951, lng: 140.476123 }
])
