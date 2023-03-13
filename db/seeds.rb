puts "\n### Admin"
FactoryBot.create(:admin, email: "admin@example.com", password: "password")
puts "Created admin: admin@example.com / password"

puts "\n### Users"
5.times do |u|
  FactoryBot.create(:user, email: "user#{u + 1}@example.com")
  puts "Created user#{u + 1}: user#{u + 1}@example.com, password"
end
