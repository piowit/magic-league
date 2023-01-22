puts "\n### Admin"
FactoryBot.create(:admin, email: "admin@example.com", password: "password")
puts "Created admin: admin@example.com / password"
