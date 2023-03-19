FactoryBot.define do
  factory :contest do
    date { Faker::Date.forward(days: 2) }
    place { Faker::Address.city }
    league
  end
end
