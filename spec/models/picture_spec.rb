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

require 'spec_helper'

describe Picture do
  pending "add some examples to (or delete) #{__FILE__}"
end
