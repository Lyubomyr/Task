# == Schema Information
#
# Table name: picture_orders
#
#  id           :integer          not null, primary key
#  picture_id   :integer
#  size         :string(255)
#  human_count  :integer
#  gel          :boolean          default(FALSE)
#  frame        :string(255)
#  comments     :text
#  status       :string(255)      default("new")
#  slug         :string(255)
#  user_name    :string(255)
#  user_mname   :string(255)
#  user_surname :string(255)
#  user_email   :string(255)
#  user_tel     :string(255)
#  user_address :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe PictureOrder do
  pending "add some examples to (or delete) #{__FILE__}"
end
