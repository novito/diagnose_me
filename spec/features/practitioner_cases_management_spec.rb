require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Managing patient cases' do
  let(:practitioner) { create(:user, :practitioner) }

  before(:each) do
    @patient_case = create(:patient_case)
  end

  scenario 'a signed in practitioner can see all the patient cases' do
    login_as(practitioner, scope: :user)
    visit practitioner_patient_cases_path

    expect(page).to have_content 'Manage your patient cases'
    expect(page).to have_link "Case #{@patient_case.id}"
    expect(page).to have_content @patient_case.user.complete_name
  end

  scenario 'a signed in practitioner can go to one of the patient cases' do
    login_as(practitioner, scope: :user)
    visit practitioner_patient_cases_path

    click_link "Case #{@patient_case.id}"
    expect(current_path).to eq(practitioner_patient_case_path(@patient_case))
  end

  scenario "a non signed in practitioner is asked to sign in first" do
    visit practitioner_patient_cases_path

    expect(page).to have_content 'You need to sign in'
  end

  scenario "a signed in user who is not a practitioner can't see anything" do
    user = create(:user)
    login_as(user, scope: :user)

    visit practitioner_patient_cases_path
    expect(page).to have_content 'You are not authorized to see this page'
  end
end
