FactoryBot.define do
  factory :offer_department do
    association :offer
    association :department
  end
end
