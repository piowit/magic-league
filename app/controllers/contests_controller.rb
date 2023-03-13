class ContestsController < ApplicationController
  before_action :authenticate_user!

  def index
    render :index, locals: { contests: Contest.all }
  end

  def new
    render :new, locals: { contest: Contest.new(league: League.find(params[:league])) }
  end

  def create
    contest = Contest.new(contest_params)
    if contest.save
      redirect_to contests_path, notice: "Contest was successfully created."
    else
      render :new, locals: { contest: contest }, status: :unprocessable_entity
    end
  end

  def show
    render :show, locals: { contest: Contest.find(params[:id]) }
  end

  private

  def contest_params
    params.require(:contest).permit(:date, :league_id)
  end
end
