class OrderMailer < ActionMailer::Base
  default from: "info@diem.com.ua"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.ticket_created.subject
  #
  def picture_order_created(picture_order)
    	@picture_order = picture_order
  	mail to: "fedorniakl@gmail.com", cc: "brusd.com@gmail.com",  subject: I18n.t("picture_order_created.subject")
  end
   :subject => I18n.t("new_message.subject", :title => @topic.subject)
  def picture_order_created_user(picture_order)
    	@picture_order = picture_order
  	mail to: picture_order.user_email,  subject: I18n.t("picture_order_created_user.subject")
  end

end
