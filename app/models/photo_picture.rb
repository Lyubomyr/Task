# == Schema Information
#
# Table name: photo_pictures
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhotoPicture < ActiveRecord::Base
  has_many :pictures
  attr_accessible :name, :t_name

  extend FriendlyId
  friendly_id :name, use: :slugged

end
