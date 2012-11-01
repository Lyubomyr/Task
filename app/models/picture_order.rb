class PictureOrder < ActiveRecord::Base
  attr_accessible :comments, :gel, :human_count, :images_path, :picture_id, :size, :user_id
end
