FactoryGirl.define do
  factory :user do
    first_name 'Doraemon'
    last_name 'Tomita'
    sequence(:email){|n| "doraemon#{n}@factory.com" }
    password 'novitanovi'
    is_practitioner false

    trait :practitioner do
      is_practitioner true
    end
  end
end
