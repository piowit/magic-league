require "rails_helper"

RSpec.describe LeaguePolicy, type: :policy do
  it "allows to update league by owner" do
    league = create(:league)
    expect(LeaguePolicy.new(league.owners.first, league).update?).to be true
  end

  it "do not allow to update league by other user" do
    league = create(:league)
    user = create(:user)
    expect(LeaguePolicy.new(user, league).update?).not_to be true
  end

  it "allows to join league by user" do
    league = create(:league)
    user = create(:user)

    expect(LeaguePolicy.new(user, league).join?).to be true
  end

  it "do not allow to join league by user who joined it earlier" do
    user = create(:user)
    league = create(:league, players: [user])

    expect(LeaguePolicy.new(user, league).join?).not_to be true
  end
end
