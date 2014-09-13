require 'rails_helper'

feature 'Welcome pages' do
  scenario 'when a new user arrives to the landing page' do
    visit root_path

    expect(page).to have_text('Welcome to Diagnose Me')
    expect(page).to have_link('Sign up')
  end
end
