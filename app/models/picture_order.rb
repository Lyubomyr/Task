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
#  images_path :string(255)
#  comments    :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PictureOrder < ActiveRecord::Base
  attr_accessible :comments, :gel, :human_count, :images_path, :picture_id, :size, :user_id
end
