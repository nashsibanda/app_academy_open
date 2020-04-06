# frozen_string_literal: true

json.extract! bench, :id, :description, :lat, :lng
json.photoUrls bench.photos.map { |file| url_for(file) }
