require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Patient cases management' do
  let(:user) { create(:user) }
  let(:practitioner) { create(:user, :practitioner) }
  before(:each) do
    login_as(user, scope: :user)
  end

  scenario 'Logged in user submits a new patient_case' do
    visit new_patient_case_path

    fill_in 'Comments', with: 'These are my comments'
    attach_file 'Tongue picture', Rails.root.join('spec/images/tongue.png')

    click_button 'Submit case'

    expect(page).to have_content 'Your case have been successfully submitted'
  end

  scenario 'Logged in user can see the list of its cases' do
    patient_case = create(:patient_case, comments: 'My stomach hurts', user: user)

    diagnose = create(
      :diagnosis, patient_case: patient_case, 
      practitioner: practitioner, comments: 'This tongue seems to be way too red'
    )

    visit patient_cases_path

    expect(page).to have_content 'My stomach hurts'
    expect(page).to have_content 'This tongue seems to be way too red'
    expect(page).to have_css("img[src*='tongue.png']")
  end
end
