require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'Sign up!' 
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in "user-email",	with: "test-username"
      fill_in "user-password",	with: "test-password"
      click_on "Create User"
      visit users_url
      expect(page).to have_content "test-username"
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    log_in_as("test-username")
    visit root_url
    expect(page).to have_content "Welcome test-username"
  end

end

feature 'logging out' do
  before(:each) do
    FactoryBot.create(:user)
  end
  
  scenario 'begins with a logged out state' do
    visit root_url
    expect(page).to have_content "Log In"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    log_in_as("test-username")
    click_on "Log Out"
    visit root_url
    expect(page).not_to have_content "test-username"  
  end

end