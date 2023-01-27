class LeaguePolicy
  attr_reader :user, :league

  def initialize(user, league)
    @user = user
    @league = league
  end

  def edit?
    league.owners.include?(user)
  end

  def update?
    edit?
  end

  def join?
    !league.players.include?(user)
  end
end
