class PictureOrdersController < ApplicationController
  before_filter :title, :content_init

  def new
    @order = PictureOrder.new()
    @order.picture_user_photos.build
    if session[:picture]
	@category = session[:picture][:cat]
	@picture = session[:picture][:pic]
	session[:picture] = nil
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
    @picture_order = PictureOrder.find(params[:id])
    @picture = @picture_order.picture
    @images = @picture_order.picture_user_photos
  end

  def edit
    @order = PictureOrder.find(params[:id])
  end

  def update
    @order = PictureOrder.find(params[:id])

      if @order.update_attributes(params[:picture_order])
        redirect_to @user, notice: 'User was successfully updated.'

      else
        render action: "edit"
      end
  end


private

  def content_init
    @calc = PictureOrderCalc.first
    @human_counts = PictureOrderCalc.all.map {|calc| calc.human_count}
    @sizes = PictureOrderCalc.all.map {|calc| calc.size}
    @frames = PictureOrderCalc.all.map {|calc| calc.frame}
    @photo_pictures = PhotoPicture.all
    @pictures = PhotoPicture.all.map {|category| category.pictures.map {|pic|
	category.name + ' - ' + pic.name} }
  end


  def title
	@page = Page.find_by_name('picture_orders')
  end

end
