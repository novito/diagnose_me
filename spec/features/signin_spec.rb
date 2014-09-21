require 'rails_helper'

feature 'Signing in' do
  let(:user) { build(:user) }

  before(:each) do
    visit new_user_session_path
  end

  scenario 'signs in with a correct email and password' do
    user = create(:user)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('File a new case')
  end

  scenario 'signs in a user that has many cases' do
    user = create(:user)
    create(:patient_case, user: user)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('Your cases')
  end
end
