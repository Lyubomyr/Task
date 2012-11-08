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

require 'spec_helper'

describe Picture do
  pending "add some examples to (or delete) #{__FILE__}"
end
