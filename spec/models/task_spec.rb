require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:team) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:started_at) }
    it 'validates status' do
      is_expected.to validate_inclusion_of(:status)
        .in_array(%w[doing done canceled])
    end
  end
end
