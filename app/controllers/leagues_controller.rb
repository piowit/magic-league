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
    render :show, locals: { league: League.find(params[:id]) }
  end

  def edit
    render :edit, locals: { league: League.find(params[:id]) }
  end

  def update
    league = League.find(params[:id])
    if league.update(league_params)
      redirect_to leagues_path, notice: "League was successfully updated."
    else
      render :edit, locals: { league: league }, status: :unprocessable_entity
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :description, :start_date, :end_date)
  end
end
