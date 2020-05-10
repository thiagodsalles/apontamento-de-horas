class TeamsController < ApplicationController
  def new
    @team = Team.new
    respond_to do |f|
      f.js
    end
  end

  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        @user_team = UserTeam.create(user_id: current_user.id, team_id: @team.id)
        format.html { redirect_to root_path, notice: 'Team was successfully created.' }
      else
        format.html { redirect_to root_path, notice: 'Team was not created.' }
      end
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
