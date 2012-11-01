class User < ActiveRecord::Base
  attr_accessible :address, :email, :mname, :name, :surname, :tel
end
