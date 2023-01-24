FactoryBot.define do
  factory :league do
    name { Faker::Company.bs }
    description { Faker::Lorem.paragraph }
    start_date { Date.current }
    end_date { Date.current + 2.months }
    owners { [create(:user)] }
  end
end
