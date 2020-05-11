class TeamsController < ApplicationController
  def new
    @team = Team.new
    respond_to { |f| f.js }
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      @user_team = UserTeam.create(user_id: current_user.id, team_id: @team.id)
      redirect_to root_path, notice: 'Team was successfully created.'
    else
      redirect_to root_path, error: 'Team was not created.'
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
