require "rails_helper"

RSpec.describe Membership, type: :model do
  it { expect(build(:membership)).to be_valid }
  it { expect(build(:membership, user: nil)).not_to be_valid }
  it { expect(build(:membership, league: nil)).not_to be_valid }

  it "has one league and two players" do
    league = create(:league)
    player1 = create(:user)
    player2 = create(:user)
    league.players << [player1, player2]

    expect(league.players).to include(player1, player2)
    expect(player1.leagues).to include(league)
    expect(player2.leagues).to include(league)
  end

  it "has two leagues and one owner" do
    league1 = create(:league)
    league2 = create(:league)
    player = create(:user)
    player.leagues << [league1, league2]

    expect(player.leagues).to include(league1, league2)
    expect(league1.players).to include(player)
    expect(league2.players).to include(player)
  end
end
