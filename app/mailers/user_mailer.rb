class UserMailer < ActionMailer::Base
  default from: "South Florida <welcome@sfso.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "Win free tickets or even a season subscription to the South Florida Symphony Orchestra’s terrific 20th Season."

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
