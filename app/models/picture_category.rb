# == Schema Information
#
# Table name: picture_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PictureCategory < ActiveRecord::Base
  has_many :pictures
  attr_accessible :name
end
