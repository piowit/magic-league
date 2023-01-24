require "rails_helper"

RSpec.describe Ownership, type: :model do
  it { expect(build(:ownership)).to be_valid }
  it { expect(build(:ownership, user: nil)).not_to be_valid }
  it { expect(build(:ownership, league: nil)).not_to be_valid }

  it "has one league and two owners" do
    league = create(:league)
    user1 = create(:user)
    user2 = create(:user)
    league.owners << [user1, user2]

    expect(league.owners).to include(user1, user2)
    expect(user1.owned_leagues).to include(league)
    expect(user2.owned_leagues).to include(league)
  end

  it "has two leagues and one owner" do
    user = create(:user)
    league1 = create(:league, owners: [user])
    league2 = create(:league, owners: [user])

    expect(user.owned_leagues).to include(league1, league2)
    expect(league1.owners).to include(user)
    expect(league2.owners).to include(user)
  end
end
