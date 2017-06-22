class UserMailer < ActionMailer::Base
  default from: "South Florida <welcome@sfso.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "win free tickets or even a season subscription for each friend who signs up!"

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
