class OrderMailer < ActionMailer::Base
  default from: "info@diem.com.ua"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.ticket_created.subject
  #
  def picture_order_created(picture_order)
    	@picture_order = picture_order
  	mail to: "fedorniakl@gmail.com", cc: "brusd.com@gmail.com",  subject:
						t(".new_picture_order")
  end

  def picture_order_created_user(picture_order)
    	@picture_order = picture_order
  	mail to: picture_order.user_email,  subject: t(".new_picture_order_user")
  end

end
