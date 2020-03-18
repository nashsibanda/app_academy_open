# frozen_string_literal: true

# json.array! @guests do |guest|
#   json.name guest.name
#   json.age guest.age
#   json.favorite_color guest.favorite_color
# end

json.partial! 'api/partials/guest', collection: @guests, as: :guest, gift_display: false
