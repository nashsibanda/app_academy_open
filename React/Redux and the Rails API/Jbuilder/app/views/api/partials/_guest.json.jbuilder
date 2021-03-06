# frozen_string_literal: true

# json.array! guest do |guest|
#   json.name guest.name
#   json.age guest.age
#   json.favorite_color guest.favorite_color
# end

if age_limit && (guest.age >= 40 && guest.age < 50)
  json.name guest.name
  json.age guest.age
  json.favorite_color guest.favorite_color
  if gift_display
    json.gifts do
      json.partial! 'api/partials/gift', collection: guest.gifts, as: :gift
    end
  end
elsif !age_limit
  json.name guest.name
  json.age guest.age
  json.favorite_color guest.favorite_color
  if gift_display
    json.gifts do
      json.partial! 'api/partials/gift', collection: guest.gifts, as: :gift
    end
  end
end
