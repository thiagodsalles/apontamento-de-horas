FactoryBot.define do
    factory :user_team do
      association :user
      association :team
    end
  end
