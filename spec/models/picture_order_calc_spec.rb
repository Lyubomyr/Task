# == Schema Information
#
# Table name: picture_order_calcs
#
#  id          :integer          not null, primary key
#  size        :string(255)
#  frame       :string(255)
#  human_count :string(255)
#  comments    :text
#  first_step  :text
#  second_step :text
#  third_step  :text
#  greeting    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe PictureOrderCalc do
  pending "add some examples to (or delete) #{__FILE__}"
end
