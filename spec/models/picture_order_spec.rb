# == Schema Information
#
# Table name: picture_orders
#
#  id          :integer          not null, primary key
#  user_id     :string(255)
#  picture_id  :string(255)
#  size        :string(255)
#  human_count :integer
#  gel         :boolean          default(FALSE)
#  image       :string(255)
#  comments    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe PictureOrder do
  pending "add some examples to (or delete) #{__FILE__}"
end
