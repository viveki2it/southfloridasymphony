# Export to CSV with the referrer_id
ActiveAdmin.register User do
  csv do
    column :id
    column :email
    column :referral_code
    column :referrer_id
    column "referrals count" do |user|
      user.referrals.count  
    end
    column :created_at
    column :updated_at
  end

  actions :index, :show
  
  index download_links: [:csv] do
    column :id
    column :email
    column :referral_code
    column :referrer_id
    column "referrals count" do |user|
      user.referrals.count  
    end
    column :created_at
    column :updated_at
    actions
  end

end
