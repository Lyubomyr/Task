# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  mname      :string(255)
#  surname    :string(255)
#  email      :string(255)
#  address    :string(255)
#  tel        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_one :picture_order

  attr_accessible :address, :email, :mname, :name, :surname, :tel

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }
  validates :mname, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: {with: email_regex},
		uniqueness: {case_sensitive: false}
  validates :address, length: { maximum: 100 }
  validates :tel, presence: true, length: { maximum: 20 }

end
