# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base
  before_create :post_to_twitter

  belongs_to :user, dependent: :destroy

  validates :user_id, :body, presence: true




  def post_to_twitter
    #Post tweets on your app to Twitter using the Twitter gem.
    user.twitter_client.update(body)
  end
end
