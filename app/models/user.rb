class User < ActiveRecord::Base

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_uid = auth_hash["info"]["uid"]
    oauth_name = auth_hash['info']['name']
    oauth_email = auth_hash['info']['email']
    #first_or_create will always return an instance of a user
    self.where(name: oauth_name).first_or_create do |user|
      user.name = oauth_name
      user.uid = oauth_uid
    end
  end
end
