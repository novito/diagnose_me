require 'rails_helper'

feature 'Managing patient cases' do
  let(:practitioner) { create(:user, :practitioner) }

  before(:each) do
    create(:patient_case)
  end

  scenario 'a practitioner can see all the patient cases' do
    visit practitioner_patient_cases_path

    expect(page).to have_content 'Manage your patient cases'
  end
end
