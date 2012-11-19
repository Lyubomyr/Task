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

class PictureUserPhoto < ActiveRecord::Base
  belongs_to :picture_order
  attr_accessible :image, :picture_order_id

  mount_uploader :image, PictureUserPhotoUploader

  validates :image, presence: true
end
