# == Schema Information
#
# Table name: picture_orders
#
#  id          :integer          not null, primary key
#  user_id     :string(255)
#  picture_id  :string(255)
#  size        :string(255)
#  human_count :integer
#  gel         :boolean
#  image       :string(255)
#  comments    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PictureOrder < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  attr_accessible :comments, :gel, :human_count, :image, :picture_id, :size, :user_id

  mount_uploader :image, ImageUploader
end
