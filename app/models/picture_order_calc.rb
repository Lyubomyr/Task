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

class PictureOrderCalc < ActiveRecord::Base
  attr_accessible :comments, :first_step, :frame, :greeting, :human_count, :second_step, :size, :third_step
end
