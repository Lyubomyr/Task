class OrderMailer < ActionMailer::Base
  default from: "prumat3@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.ticket_created.subject
  #
  def picture_order_created(picture_order)
    @picture_order = picture_order

    mail to: "fedorniakl@gmail.com",  subject: "New order created"
  end
end
