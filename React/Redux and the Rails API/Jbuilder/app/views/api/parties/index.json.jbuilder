# frozen_string_literal: true

json.partial! 'api/partials/party', collection: @parties, as: :party, gift_display: false
