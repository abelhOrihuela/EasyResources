class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]


  def self.find_or_create_by_omniauth(auth, signed_in_resource=nil)
    user=User.where(provider: auth[:provider], uid: auth[:uid]).first
    unless user
      user = User.create(
      email: '#{auth[:uid]}@#{auth[:uid]}.com',
      name: auth[:name],
      provider: auth[:provider],
      uid: auth[:uid],
      password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

end
