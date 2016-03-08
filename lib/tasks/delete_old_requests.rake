namespace :delete do
  task old_requests: :environment do
    puts "delete old requests"
    requests = Request.accepted
    requests.destroy_all
  end
end
