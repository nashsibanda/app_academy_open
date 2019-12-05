require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up!"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'user_email', :with => "testing@email.com"
      fill_in 'user_password', :with => "biscuits"
      click_button "Sign Up!"
    end

    scenario "redirects to bands index page after signup" do
      expect(page).to have_content "Log in!"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'user_email', :with => "testing@email.com"
      click_button "Sign Up!"
    end

    scenario "re-renders the signup page after failed signup" do
      expect(page).to have_content "Sign Up!"
      expect(page).to have_content "must be longer than 6 characters"
    end
  end

end