FactoryBot.define do
  factory :user do
    email { 'mail@mail.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end

  trait :collaborator do
    role { 'collaborator' }
  end

  trait :manager do
    role { 'manager' }
  end

  factory :collaborator, traits: [:collaborator]
  factory :manager, traits: [:manager]
end
