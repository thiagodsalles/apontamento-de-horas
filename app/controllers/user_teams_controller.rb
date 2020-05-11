class UserTeamsController < ApplicationController
  def create
    @user_team = UserTeam.new(params.permit(:user_id, :team_id))
    if @user_team.save
      redirect_to root_path, notice: 'User joined successfully'
    else
      redirect_to root_path, error: 'User was not joined'
    end
  end
end
