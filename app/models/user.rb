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
  attr_accessible :address, :email, :mname, :name, :surname, :tel
end
