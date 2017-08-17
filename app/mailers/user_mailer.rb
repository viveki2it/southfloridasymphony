class UserMailer < ActionMailer::Base
  default from: "South Florida Symphony Orchestra <welcome@sfso.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "CLICK 2 WIN free tickets or season subscription to South Florida Symphony Orchestra’s 20thSeason!"

    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
