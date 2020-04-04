# frozen_string_literal: true

json.partial! 'api/benches/bench', collection: @benches, as: :bench

# json.array! @benches do |bench|
#   json.set! bench.id.to_i do
#     json.partial! 'api/benches/bench', bench: bench, as: :bench
#   end
# end
