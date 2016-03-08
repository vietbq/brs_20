every "0 0 1 * *" do
  rake "delete:old_requests"
end
