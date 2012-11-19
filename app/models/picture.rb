# == Schema Information
#
# Table name: pictures
#
#  id               :integer          not null, primary key
#  photo_picture_id :integer
#  name             :string(255)
#  image            :string(255)
#  image_mini       :string(255)
#  slug             :string(255)
#  title            :string(255)
#  alt              :string(255)
#  text             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Picture < ActiveRecord::Base
  belongs_to :photo_picture
  has_one :picture_order
  default_scope :order => 'pictures.name'
  attr_accessible :name, :image, :title, :alt, :text

  delegate :id_on_photo_picture, to: :picture_order, allow_nil: true
  extend FriendlyId
  friendly_id :name, use: :scoped, :scope => :photo_picture

  def should_generate_new_friendly_id?
	name_changed?
  end

end
