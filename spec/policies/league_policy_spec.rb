require "rails_helper"

RSpec.describe LeaguePolicy, type: :policy do
  it "allow to update league by owner" do
    league = create(:league)
    expect(LeaguePolicy.new(league.owners.first, league).update?).to be true
  end

  it "do not allow to update league by other user" do
    league = create(:league)
    user = create(:user)
    expect(LeaguePolicy.new(user, league).update?).not_to be true
  end
end
