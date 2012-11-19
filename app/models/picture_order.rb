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

class PictureOrder < ActiveRecord::Base
  belongs_to :picture
  has_many :picture_user_photos
  accepts_nested_attributes_for :picture_user_photos, allow_destroy: true

attr_accessible :picture_user_photos_attributes, :picture_id, :size, :human_count,
	:gel, :frame, :comments, :user_name, :user_mname, :user_surname, :user_email,
	:user_tel, :user_address, :data, :expires_at

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :user_mname, length: { maximum: 50 }
  validates :user_surname, presence: true, length: { maximum: 50 }
  validates :user_email, presence: true, format: {with: email_regex}
		#uniqueness: {case_sensitive: false}
  validates :user_address, length: { maximum: 100 }
  validates :user_tel, presence: true, length: { maximum: 20 }
  validates :comments, :length => { :maximum => 500 }

  def picture_order_created_email
	OrderMailer.picture_order_created(self).deliver
  end


end
