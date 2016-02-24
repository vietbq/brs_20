namespace :admin do
  desc "Create admin account"
  task create_admin: :environment do
    puts "Admin account have been created"
    User.create username: "Mai DinhPhu",
      email: "dinhphu94@gmail.com",
      password: "12345678",
      password_confirmation: "12345678",
      role: User.roles[:admin]
    User.create username: "Admin",
      email: "admin@gmail.com",
      password: "12345678",
      password_confirmation: "12345678",
      role: User.roles[:admin]
  end
end
