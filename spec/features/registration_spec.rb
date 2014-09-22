require 'rails_helper'

feature 'Signing up' do
  let(:user) { build(:user) }

  before(:each) do 
    visit new_user_registration_path
  end

  scenario 'signs up with a correct email and password' do
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, match: :prefer_exact
    fill_in 'Password confirmation', with: user.password, match: :prefer_exact
    find("input[type='checkbox']").set(true)

    click_button 'Sign up'

    expect(page).to have_text 'File a new case'
  end

  scenario "can't sign up without a first name" do
    fill_in 'First name', with: '   '
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, match: :prefer_exact
    fill_in 'Password confirmation', with: user.password, match: :prefer_exact
    find("input[type='checkbox']").set(true)

    click_button 'Sign up'

    expect(page).to have_text "First name can't be blank"
  end

  scenario "can't sign up without a last name" do
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: '   '
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, match: :prefer_exact
    fill_in 'Password confirmation', with: user.password, match: :prefer_exact
    find("input[type='checkbox']").set(true)

    click_button 'Sign up'

    expect(page).to have_text "Last name can't be blank"
  end

  scenario "can't sign up if password is shorter than 8 chars" do
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password[0], match: :prefer_exact
    fill_in 'Password confirmation', with: user.password[0], match: :prefer_exact
    find("input[type='checkbox']").set(true)

    click_button 'Sign up'

    expect(page).to have_text "Password is too short"
  end

  scenario "can't sign up if password confirmation does not match password" do
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, match: :prefer_exact
    fill_in 'Password confirmation', with: user.password.reverse, match: :prefer_exact
    find("input[type='checkbox']").set(true)

    click_button 'Sign up'

    expect(page).to have_text "Password confirmation doesn't match"
  end

  scenario "can't sign up if password is blank" do
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '      ', match: :prefer_exact
    fill_in 'Password confirmation', with: '     ', match: :prefer_exact
    find("input[type='checkbox']").set(true)

    click_button 'Sign up'

    expect(page).to have_text "Password can't be blank"
  end

  scenario "can't sign up if terms & conditions are not checked" do
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password, match: :prefer_exact
    fill_in 'Password confirmation', with: user.password, match: :prefer_exact

    click_button 'Sign up'
    expect(page).to have_text "Terms and conditions must be accepted"
  end
end
