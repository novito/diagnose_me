require 'rails_helper'

feature 'Signing in' do
  let(:user) { create(:user) }

  before(:each) do
    visit new_user_session_path
  end

  scenario 'signs in with a correct email and password' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('File a new case')
  end

  scenario 'signs in a user that has many cases' do
    create(:patient_case, user: user)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Your cases')
  end

  scenario 'signs in a practitioner when there are no cases' do
    practitioner = create(:user, :practitioner)

    fill_in 'Email', with: practitioner.email
    fill_in 'Password', with: practitioner.password

    click_button 'Sign in'

    expect(current_path).to eq(practitioner_patient_cases_path)
  end
end
