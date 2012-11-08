# == Schema Information
#
# Table name: pictures
#
#  id               :integer          not null, primary key
#  photo_picture_id :integer
#  name             :string(255)
#  image            :string(255)
#  slug             :string(255)
#  title            :string(255)
#  alt              :string(255)
#  text             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Picture < ActiveRecord::Base
  belongs_to :photo_picture

  attr_accessible :name, :image, :title, :alt, :text

  extend FriendlyId
  friendly_id :name, use: :slugged

end
