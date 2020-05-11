require 'rails_helper'

RSpec.describe UserTeam, type: :model do
  context 'user_team' do
    let!(:user_team) { create(:user_team) }

    it { should belong_to(:user) }
    it { should belong_to(:team) }
  end
end
