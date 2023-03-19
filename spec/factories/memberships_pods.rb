FactoryBot.define do
  factory :memberships_pod do
    pod
    membership
    place { rand(1..5) }
    points { rand(1..5) }
    commander_name { Faker::TvShows::Community.characters }
  end
end
