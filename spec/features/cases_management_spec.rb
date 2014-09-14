require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Patient cases management' do
  scenario 'Logged in user submits a new patient_case' do
    user = create(:user)
    login_as(user, scope: :user)

    visit new_patient_case_path

    fill_in 'Comments', with: 'These are my comments'
    attach_file 'Tongue picture', Rails.root.join('spec/images/tongue.png')

    click_button 'Submit case'

    expect(page).to have_content 'Your case have been successfully submitted'
  end
end
