class PictureOrderStepsController < ApplicationController


  include Wicked::Wizard
  steps :picture, :user, :verify

  def show
    @picture = PictureOrder.new
    render_wizard
  end

private

  def title
	@page = Page.find_by_name('picture_orders')
  end

  def redirect_to_finish_wizard(picture_order)
    redirect_to picture_order_url(picture_order), notice: "Thank you for signing up."
  end
end
