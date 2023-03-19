puts "\n### Admin"
FactoryBot.create(:admin, email: "admin@example.com", password: "password")
puts "Created admin: admin@example.com / password"

puts "\n### Users"
FactoryBot.create(:user, email: "user1@example.com", password: "password")
puts "Created user: user1@example.com / password"
