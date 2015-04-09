class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.save
    end
  end

  def picture_url params={}
    "http://graph.facebook.com/#{uid}/picture?type=#{params[:size].to_s}"
  end
end
