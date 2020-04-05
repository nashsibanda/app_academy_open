# frozen_string_literal: true

json.extract! review, :rating, :comment, :api_bench_id, :user_id, :id
json.username review.user.username
