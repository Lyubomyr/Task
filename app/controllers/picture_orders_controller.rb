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
    end
  end

  def create
    @order = PictureOrder.new(params[:picture_order])

    if @order.save
      flash[:notice] = "PictureOrder saved!"
      redirect_to @order
    else
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
    @human_counts = PictureOrderCalc.all.map {|calc| calc.human_count}
    @sizes = PictureOrderCalc.all.map {|calc| calc.size}
    @frames = PictureOrderCalc.all.map {|calc| calc.frame}
  end


  def title
	@page = Page.find_by_name('picture_orders')
  end

end
