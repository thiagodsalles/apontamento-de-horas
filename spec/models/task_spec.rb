require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'task' do
    let!(:task) { create(:task) }

    it { should belong_to(:user) }
    it { should belong_to(:team) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:started_at) }
    it { expect(task.status).to eq('doing') }
    it { expect(task.title).to eq('task-title') }
    it { expect(task.started_at).to eq(DateTime.parse('2020-01-01')) }
    it { expect(task.finished_at).to eq(nil) }
    it { expect(task.reason).to eq(nil) }
    it do
      should validate_inclusion_of(:status)
        .in_array(%w[doing done canceled])
    end
  end

  context 'doing' do
    let!(:task) { create(:task, :doing) }

    it { expect(task.status).to eq('doing') }
  end

  context 'done' do
    let!(:task) { create(:task, :done) }

    it { expect(task.status).to eq('done') }
    it { expect(task.finished_at).to eq(DateTime.parse('2020-01-02')) }
  end

  context 'canceled' do
    let!(:task) { create(:task, :canceled) }

    it { expect(task.status).to eq('canceled') }
    it { expect(task.reason).to eq('reason-text') }
    it { expect(task.finished_at).to eq(DateTime.parse('2020-01-02')) }
  end
end
