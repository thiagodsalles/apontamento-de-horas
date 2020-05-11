require 'rails_helper'

RSpec.describe User, type: :model do

  context 'user' do
    let!(:user) { create(:user) }

    it { should have_many(:tasks) }
    it { should have_many(:user_teams) }
    it { should have_many(:teams) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { expect(user.role).to eq('collaborator') }
    it { expect(user.email).to eq('mail@mail.com') }
    it do
      should validate_inclusion_of(:role)
        .in_array(%w[collaborator manager])
    end
  end

  context 'manager' do
    let!(:manager) { create(:user, :manager) }

    it { expect(manager.role).to eq('manager') }
  end

  context 'collaborator' do
    let!(:collaborator) { create(:user, :collaborator) }

    it { expect(collaborator.role).to eq('collaborator') }
  end
end
