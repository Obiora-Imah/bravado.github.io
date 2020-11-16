FactoryBot.define do
  factory :offer do
    price { 200 }

    association :company

    trait :with_departments do
      after :create do |a|
        departments = create_list :department, 3
          departments.each do|dept|
            create :offer_department, offer: a, department: dept
          end
      end
    end
  end
end
