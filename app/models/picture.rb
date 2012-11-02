# == Schema Information
#
# Table name: pictures
#
#  id                  :integer          not null, primary key
#  picture_category_id :string(255)
#  name                :string(255)
#  image_path          :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Picture < ActiveRecord::Base
  has_one :picture_category
  attr_accessible :picture_category_id, :image_path, :name
end
