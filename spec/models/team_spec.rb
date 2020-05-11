require 'rails_helper'

RSpec.describe Team, type: :model do
  context 'team' do
    let!(:team) { create(:team) }

    it { should have_many(:users) }
    it { should have_many(:tasks) }
    it { should have_many(:user_teams) }
    it { is_expected.to validate_presence_of(:name) }
    it { expect(team.name).to eq('team-name') }
  end
end
