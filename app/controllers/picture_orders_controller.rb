class PictureOrdersController < ApplicationController
  def new
	@picture_order = PictureOrder.new
	@user = @picture_order.build_user
  end

  def show
	@picture_order = PictureOrder.find(params[:id])
  end

 def create
    @picture_order = PictureOrder.new(params[:picture_order])

    if @picture_order.save
      flash[:success] = "Picture Order successfuly created"
      redirect_to @picture_order
    else
      #@title = "Sign up"
      render 'new'
    end
  end

  def edit
    @picture_order = PictureOrder.find(params[:id])
    @title = "Edit picture_order"
  end

  def update
    @picture_order = PictureOrder.find(params[:id])
    if @picture_order.update_attributes(params[:picture_order])
      flash[:success] = "Profile updated."
      redirect_to @picture_order
    else
      @title = "Edit picture order"
      render 'edit'
    end
  end
end
