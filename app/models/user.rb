class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :trips
  has_many :tracks

  def self.find_for_facebook_oauth(auth)
    User.find_or_create_by(email: auth[:email]) do |user|
      user.avatar_url = auth[:avatar_url]
      user.provider   = 'facebook'
      user.uid        = auth[:uid]
      user.first_name = auth[:first_name]
      user.last_name  = auth[:last_name]
      user.gender     = auth[:gender]
      user.date_of_birth     = auth[:date_of_birth]

      if user.new_record?
        user.email    = auth[:email]
        user.password = Devise.friendly_token[6,10]
      end
    end
  end

end
