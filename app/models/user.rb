require 'users_helper'

class User < ActiveRecord::Base
  belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id'
  has_many :referrals, class_name: 'User', foreign_key: 'referrer_id'

  validates :email, presence: true, :uniqueness => {:message => "Eamil is already taken"}, format: {
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    message: 'Invalid email format.'
  }
  validates :referral_code, uniqueness: true

  before_create :create_referral_code
  after_create :send_welcome_email

  REFERRAL_STEPS = [
    {
      'count' => 10,
      'html1' => 'Omw Tank top',
      'class' => 'two',
      'image' =>  ActionController::Base.helpers.asset_path(
        'assets/refer/pov-pole-1.png')
    },
    {
      'count' => 25,
      'html1' => 'Friday Therapy <br> Pool Party Ticket',
      'class' => 'three',
      'image' =>  ActionController::Base.helpers.asset_path(
        'assets/refer/360fly-divehousing-front.png')
    },
    {
      'count' => 50,
      'html1' => 'Friday Cadabra <br> After Hours Ticket',
      'class' => 'four',
      'image' =>  ActionController::Base.helpers.asset_path(
        'assets/refer/vr-headset-closeup.png')
    },
    {
      'count' => 75,
      'html1' => 'Riptide at Typhoon <br> Lagoon Ticket',
      'class' => 'five',
      'image' =>  ActionController::Base.helpers.asset_path(
        'assets/refer/hd3_1.png')
    }
  ]

  private

  def create_referral_code
    self.referral_code = UsersHelper.unused_referral_code
  end

  def send_welcome_email
    UserMailer.signup_email(self).deliver_now
  end
end
