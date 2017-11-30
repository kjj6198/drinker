class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :orders
  has_many :menus


  def self.from_omniauth(account)
    data = account.info
    user = User.where(:email => data.email).first

    unless user
      user = User.create(username: data.name,
            email: data.email,
            password: Devise.friendly_token[0,20])
      return user
    end

    user
  end
end
