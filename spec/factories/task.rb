FactoryBot.define do
  factory :task do
    title { 'task-title' }
    started_at { Time.zone.now.round }
    association :user
    association :team

    trait :doing do
      status { 'doing' }
    end

    trait :done do
      status { 'done' }
      finished_at { Time.zone.now.round }
    end

    trait :canceled do
      status { 'canceled' }
      reason { 'reason-text' }
      finished_at { Time.zone.now.round }
    end

    factory :doing, traits: [:doing]
    factory :done, traits: [:done]
    factory :canceled, traits: [:canceled]
  end
end
