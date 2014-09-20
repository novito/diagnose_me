FactoryGirl.define do
  factory :diagnosis do
    patient_case
    association :practitioner, factory: [:user, :practitioner]
    comments 'This tongue is really red. Like a red pepper'
  end
end
