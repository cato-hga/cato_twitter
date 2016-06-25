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
  belongs_to :user, dependent: :destroy

  validates :user_id, :body, presence: true

  before_create :post_to_twitter


  def post_to_twitter
    user.twitter.update(body)
  end
end
