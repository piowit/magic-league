FactoryBot.define do
  factory :league do
    name { Faker::Company.bs }
    description { Faker::Lorem.paragraph }
    start_date { Date.current }
    end_date { Date.current + 2.months }
    owners { [create(:user)] }
    image_url { Faker::LoremFlickr.image(size: "250x250", search_terms: ["magic"]) }
    rules { Faker::Markdown.random }
  end
end
