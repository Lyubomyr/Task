# == Schema Information
#
# Table name: picture_user_photos
#
#  id               :integer          not null, primary key
#  picture_order_id :integer
#  image            :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe PictureUserPhoto do
  pending "add some examples to (or delete) #{__FILE__}"
end
