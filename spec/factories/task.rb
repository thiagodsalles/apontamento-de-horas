FactoryBot.define do
  factory :task do
    title { 'task-title' }
    started_at { DateTime.parse('2020-01-01') }
    association :user
    association :team

    trait :doing do
      status { 'doing' }
    end

    trait :done do
      status { 'done' }
      finished_at { DateTime.parse('2020-01-02') }
    end

    trait :canceled do
      status { 'canceled' }
      reason { 'reason-text' }
      finished_at { DateTime.parse('2020-01-02') }
    end

    factory :doing, traits: [:doing]
    factory :done, traits: [:done]
    factory :canceled, traits: [:canceled]
  end
end
