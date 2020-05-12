require 'rails_helper'

RSpec.describe UserTeam, type: :model do
  describe 'Validations' do
    it { expected.to belong_to(:user) }
    it { expected.to belong_to(:team) }
  end
end
