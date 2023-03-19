FactoryBot.define do
  factory :contest do
    date { Faker::Date.forward(days: 2) }
    league
  end
end
