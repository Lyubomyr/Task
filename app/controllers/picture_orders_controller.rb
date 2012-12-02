class PictureOrdersController < ApplicationController
  before_filter :title, :content_init

  def new
    @order = PictureOrder.new()
    @order.picture_user_photos.build
    gon.pictures = Picture.all.map{|pic| [pic.photo_picture_id, pic.id,
						pic.image_mini]} if gon
    if session[:picture]
	@category = session[:picture][:cat]
	@picture = session[:picture][:pic]
	@image = Picture.find(@picture).image_mini
    end
  end

  def create
    @image = nil
    @order = PictureOrder.new(params[:picture_order])
    @order.price = params[:picture_order][:price]

    if @order.save
      OrderMailer.picture_order_created(@order).deliver
      OrderMailer.picture_order_created_user(@order).deliver
      flash[:notice] = PictureOrderCalc.first.greeting
      redirect_to @order
    else
    gon.pictures = Picture.all.map{|pic| [pic.photo_picture_id, pic.id,
						pic.image_mini]} if gon
      render "new"
    end
  end

  def show
    session[:picture] = nil
    @picture_order = PictureOrder.find(params[:id])
    @picture = @picture_order.picture
    @images = @picture_order.picture_user_photos
  end

private

  def content_init
    @calc = PictureOrderCalc.first
    @human_counts = PictureOrderCalc.pluck(:human_count).select {|hum| hum unless 		hum.empty? }
    @sizes = PictureOrderCalc.order(:id).pluck(:size).select {|size| size unless size.empty?}
    @frames = PictureOrderCalc.pluck(:frame).select {|frame| frame unless frame.empty?}
  end


  def title
	@page = Page.find_by_name('picture_orders')
  end

end
