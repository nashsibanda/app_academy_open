namespace :shorturl do
  desc "Purge URLs that haven't been used for a while (10 mins default)"
  task :purge_old_urls, [:mins] => :environment do
    mins = args[:mins].to_i || 10
    puts "Purging old URLs..."
    ShortenedUrl.purge(mins)
  end
end