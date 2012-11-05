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

class PictureOrder < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  accepts_nested_attributes_for :user

  attr_accessible :user_attributes, :comments, :gel,
		:human_count, :image, :picture_id, :size

  validates :image, presence: true
  validates :comments, :length => { :maximum => 250 }

  mount_uploader :image, ImageUploader


  def picture_order_created_email
	OrderMailer.picture_order_created(self).deliver
  end
end
