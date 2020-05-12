require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:users) }
    it { is_expected.to have_many(:tasks) }
    it { is_expected.to have_many(:user_teams) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
