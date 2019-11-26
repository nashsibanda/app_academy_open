class UserMailer < ApplicationMailer
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to a/A!')
  end
end
