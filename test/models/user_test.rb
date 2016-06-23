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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
