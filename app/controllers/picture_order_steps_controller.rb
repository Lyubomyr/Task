class PictureOrderStepsController < ApplicationController


  include Wicked::Wizard
  steps :picture, :user, :verify

  def show
    @picture = PictureOrder.new
    @calc = PictureOrderCalc.first
    @human_counts = PictureOrderCalc.all.map {|calc| calc.human_count}
    @sizes = PictureOrderCalc.all.map {|calc| calc.size}
    @frames = PictureOrderCalc.all.map {|calc| calc.frame}
    render_wizard
  end

  def update
    @picture = PictureOrder.new
    @picture.attributes = params[:picture_order]
    render_wizard @picture
  end

private

  def title
	@page = Page.find_by_name('picture_orders')
  end

  def redirect_to_finish_wizard(picture_order)
    redirect_to picture_order_url(picture_order), notice: "Thank you for signing up."
  end
end
