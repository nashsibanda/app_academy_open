module AuthFeaturesHelper
  def sign_up_as(username = "test-username")
    visit new_user_url
    fill_in "user-email",	with: username
    fill_in "user-password",	with: "test-password"
    click_on "Create User"
  end

  def log_in_as(username = "test-username")
    visit new_session_url
    fill_in "user-email",	with: username
    fill_in "user-password",	with: "test-password"
    click_on "Log In"
  end
end