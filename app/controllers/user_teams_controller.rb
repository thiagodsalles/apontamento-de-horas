class UserTeamsController < ApplicationController
  def create
    @user_team = UserTeam.new(params.permit(:user_id, :team_id))
    respond_to do |format|
      if @user_team.save
        format.html { redirect_to root_path, notice: 'User team was successfully created.' }
      else
        format.html { redirect_to root_path, notice: 'User team was not created.' }
      end
    end
  end
end
