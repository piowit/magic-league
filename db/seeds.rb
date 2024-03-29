puts "\n### Admin"
FactoryBot.create(:admin, email: "admin@example.com", password: "password")
puts "Created admin: admin@example.com / password"

puts "\n### Users"
(1..5).each do |u|
  FactoryBot.create(:user, email: "user#{u}@example.com")
  puts "Created user#{u}: user#{u}@example.com, password"
end
