FactoryBot.define do
  factory :user do
    name { "Obiora" }

    association :company

    trait :departments do
      after :create do |a|
        departments = create_list :department, 3
          departments.each do|dept|
            create :user_department,
             user: a, department: dept
          end
      end
    end
  end
end
