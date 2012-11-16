class PictureOrdersController < ApplicationController
  before_filter :title

  def new
	redirect_to picture_order_steps_path
  end

  def create
 	@picture_order = PictureOrder.new
	redirect_to picture_order_steps_path
  end


private

  def title
	@page = Page.find_by_name('picture_orders')
  end

end
