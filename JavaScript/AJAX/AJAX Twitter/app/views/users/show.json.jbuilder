json.array!(@user_tweets) do |tweet|
  json.partial!("tweets/tweet", tweet: tweet)
end