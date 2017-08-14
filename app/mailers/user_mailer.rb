class UserMailer < ActionMailer::Base
  default from: "South Florida <welcome@sfso.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "Click here to win free tickets or a season subscription to South Florida Symphony Orchestra’s 20th Season!"

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
