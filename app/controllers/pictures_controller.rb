class PicturesController < ApplicationController
  def index
	@pictures = Picture.where('photo_picture_id = ?',
		params[:photo_picture]).page(params[:page]).per(20)
  end

  def show
	@picture = Picture.find(params[:id])
  end
end
