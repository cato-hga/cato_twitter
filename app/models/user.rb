# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  provider        :string
#  uid             :string
#  name            :string
#  image           :string
#  token           :string
#  secret          :string
#  description     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  location        :string
#  image_profile   :string
#  followers_count :integer
#

class User < ActiveRecord::Base

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update name: auth_hash.info.name,
                image: auth_hash.info.image,
                location: auth_hash.info.location,
                description: auth_hash.info.description,
                token: auth_hash.credentials.token,
                secret: auth_hash.credentials.secret
    user
  end


end
