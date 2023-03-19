class LeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
    render :index, locals: { leagues: League.all }
  end

  def new
    render :new, locals: { league: League.new }
  end

  def create
    league = League.new(league_params)
    if league.save
      redirect_to leagues_path, notice: "League was successfully created."
    else
      render :new, locals: { league: league }, status: :unprocessable_entity
    end
  end

  def show
    league = League.find(params[:id])
    past_contests = Contest.where(league_id: params[:id]).where("date < ?", Time.current)
    upcoming_contests = Contest.where(league_id: params[:id]).where("date > ?", Time.current)
    today_contests = Contest.where(league_id: params[:id]).where("date = ?", Time.current)
    memberships = Membership.where(league_id: params[:id])

    render :show, locals: { league:, past_contests:, upcoming_contests:, today_contests:, memberships: }
  end

  def edit
    render :edit, locals: { league: League.find(params[:id]) }
  end

  def update
    league = League.find(params[:id])
    authorize league
    if league.update(league_params)
      redirect_to leagues_path, notice: "League was successfully updated."
    else
      render :edit, locals: { league: league }, status: :unprocessable_entity
    end
  end

  def join
    league = League.find(params[:id])
    authorize league
    if Membership.new(league: league, user: current_user).save
      redirect_to leagues_path, notice: "You joined to #{league.name} league!"
    else
      render :index, locals: { league: league }, status: :unprocessable_entity
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :description, :start_date, :end_date).merge(owners: [current_user])
  end
end
