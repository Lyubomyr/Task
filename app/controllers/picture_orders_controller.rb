class PictureOrdersController < ApplicationController
  before_filter :title, :content_init

  def new
    session[:order_params] ||= {}
    @order = PictureOrder.new(session[:order_params])
    @order.current_step = session[:order_step]
  end

  def create
    session[:order_params].deep_merge!(params[:picture_order]) if params[:picture_order]
    @order = PictureOrder.new(session[:order_params])
    @order.current_step = session[:order_step]
    if @order.valid?
      if params[:back_button]
        @order.previous_step
      elsif @order.last_step?
        @order.save if @order.all_valid?
      else
        @order.next_step
      end
      session[:order_step] = @order.current_step
    end
    if @order.new_record?
      render "new"
    else
      session[:order_step] = session[:order_params] = nil
      flash[:notice] = "PictureOrder saved!"
      redirect_to @order
    end
  end


private

  def content_init
    @calc = PictureOrderCalc.first
    @human_counts = PictureOrderCalc.all.map {|calc| calc.human_count}
    @sizes = PictureOrderCalc.all.map {|calc| calc.size}
    @frames = PictureOrderCalc.all.map {|calc| calc.frame}
  end


  def title
	@page = Page.find_by_name('picture_orders')
  end

end
