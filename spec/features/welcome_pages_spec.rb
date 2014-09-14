require 'rails_helper'

feature 'Welcome pages' do
  scenario 'when a new user arrives to the landing page' do
    visit root_path

    expect(page).to have_text('Welcome to Diagnose My Tongue')
    expect(page).to have_link('Sign up')
  end

  scenario 'when a user who is logged in arrives to the landing page' do
    user = create(:user)
    login_as(user, scope: :user)

    visit root_path

    expect(page).not_to have_link('Sign up')
  end
end
