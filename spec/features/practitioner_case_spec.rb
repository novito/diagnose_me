require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Managing a patient case' do
  let(:practitioner) { create(:user, :practitioner) }
  let(:patient_case) { create(:patient_case) }

  before(:each) do
    login_as(practitioner, scope: :user)
    visit practitioner_patient_case_path(patient_case)
  end

  scenario 'can see the details of the case' do
    expect(page).to have_text("Patient case #{patient_case.id}")
    expect(page).to have_text("Patient Name: #{patient_case.user.complete_name}")
    expect(page).to have_css("img[src*='tongue.png']")
  end

  scenario 'can see a button to create new diagnosis if there are no diagnosis yet' do
    expect(page).to have_link("Create new diagnosis")
  end

  scenario 'can see existing diagnosis' do
    create(:diagnosis, comments: 'This is a good tongue!', patient_case: patient_case)
    visit practitioner_patient_case_path(patient_case)

    expect(page).to have_text('Diagnoses')
    expect(page).to have_text('This is a good tongue!')
  end

  scenario 'can click on edit an existing diagnose created by current user' do
    create(:diagnosis, comments: 'This is a good tongue!', patient_case: patient_case)
    visit practitioner_patient_case_path(patient_case)

    expect(page).to have_text('Edit diagnosis')
  end
end
