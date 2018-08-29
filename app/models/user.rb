class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_uid = auth_hash["info"]["email"]
    oauth_name = auth_hash['info']['nickname']
    #first_or_create will always return an instance of a user
    where(uid: oauth_uid).first_or_create do |user|
      user.email = oauth_email
      user.username = oauth_username
      user.password = SecureRandom.hex(10)
    end
  end
end
