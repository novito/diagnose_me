include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :patient_case do
    comments 'My tongue looks red'
    tongue { fixture_file_upload(Rails.root.join('spec', 'images', 'tongue.png'), 'image/png') }
    user

    trait :large_image do
      tongue { fixture_file_upload(Rails.root.join('spec', 'images', 'soccer_silver.jpg'), 'image/jpg') }
    end
  end
end
