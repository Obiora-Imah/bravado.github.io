FactoryBot.define do
  factory :user_department do
    association :user
    association :department
  end
end
