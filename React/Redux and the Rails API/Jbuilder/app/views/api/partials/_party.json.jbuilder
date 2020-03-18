# frozen_string_literal: true

json.name party.name
json.location party.location
json.guests do
  json.partial! 'api/partials/guest', collection: party.guests, as: :guest, gift_display: gift_display, age_limit: false
end
