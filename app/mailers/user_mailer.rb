class UserMailer < ActionMailer::Base
  default from: "One Magical Weekend <welcome@menud.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "#One Magical Weekend"

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
