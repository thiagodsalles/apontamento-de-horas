require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:tasks) }
    it { is_expected.to have_many(:user_teams) }
    it { is_expected.to have_many(:teams) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it 'validates role' do
      is_expected.to validate_inclusion_of(:role)
        .in_array(%w[collaborator manager])
    end
  end

  describe 'Scopes' do
    describe '.collaborators' do
      subject { User.collaborators }
      it { expect(subject.where_values_hash).to eq('role' => 'collaborator') }
    end

    describe '.managers' do
      subject { User.managers }
      it { expect(subject.where_values_hash).to eq('role' => 'manager') }
    end
  end
end
