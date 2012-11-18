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
  has_many :pictures
  has_many :picture_user_photos
  accepts_nested_attributes_for :picture_user_photos
  accepts_nested_attributes_for :pictures

attr_accessible :picture_user_photo_attributes, :pictures_attributes, :size, :human_count, :gel,
:frame, :comments, :user_name, :user_mname, :user_surname, :user_email, :user_tel, :user_address

attr_writer :current_step

	#validates_presence_of :shipping_name, :if => lambda { |o| o.current_step == "shipping" }
	#validates_presence_of :billing_name, :if => lambda { |o| o.current_step == "billing" }

	def current_step
	  @current_step || steps.first
	end

	def steps
	  %w[picture user verify]
	end

	def next_step
	  self.current_step = steps[steps.index(current_step)+1]
	end

	def previous_step
	  self.current_step = steps[steps.index(current_step)-1]
	end

	def first_step?
	  current_step == steps.first
	end

	def last_step?
	  current_step == steps.last
	end

	def all_valid?
	  steps.all? do |step|
	    self.current_step = step
	    valid?
	  end
	end
  #email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :user_name, presence: true, length: { maximum: 50 }, if: :on_user_step?
  #validates :user_mname, length: { maximum: 50 }, if: :on_user_step?
  #validates :user_surname, presence: true, length: { maximum: 50 }, if: :on_user_step?
  #validates :user_email, presence: true, format: {with: email_regex}, if: :on_user_step?
		#uniqueness: {case_sensitive: false}
  #validates :user_address, length: { maximum: 100 }, if: :on_user_step?
  #validates :user_tel, presence: true, length: { maximum: 20 }, if: :on_user_step?
  #validates :comments, :length => { :maximum => 500 }

  def picture_order_created_email
	OrderMailer.picture_order_created(self).deliver
  end


end
