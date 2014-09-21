require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Diagnosing cases' do
  let(:practitioner) { create(:user, :practitioner) }
  let(:patient_case) { create(:patient_case) }
  
  before(:each) do
    login_as(practitioner, scope: :user)
  end

  scenario "a practitioner can't add a new diagnosis if the case does not exist" do
    visit new_practitioner_patient_case_diagnosis_path(10)

    expect(page).to have_content 'Patient case 10 was not found'
  end

  scenario 'a practitioner can add a new diagnose for a case' do
    visit new_practitioner_patient_case_diagnosis_path(patient_case)
    fill_in 'Comments', with: 'It is a pretty red tongue'

    click_button 'Submit diagnosis'
    expect(page).to have_content 'Diagnosis has been added correctly'
  end

  scenario 'a practitioner can edit an existing diagnose for a case' do
    diagnosis = create(:diagnosis, practitioner: practitioner, comments: 'This tongue is red!', patient_case: patient_case)
    visit edit_practitioner_patient_case_diagnosis_path(patient_case, diagnosis)

    fill_in 'Comments', with: 'This tongue is blue!'
    click_button 'Update diagnosis'
    expect(page).to have_content 'This tongue is blue'
  end
end
