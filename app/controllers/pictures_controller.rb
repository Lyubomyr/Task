class PicturesController < ApplicationController
  def index
	@pictures = Picture.where('photo_picture_id = ?',
		params[:photo_picture]).page(params[:page]).per(20)
  end

  def show
	@picture = PhotoPicture.find(params[:photo_picture_id]).
				pictures.find(params[:id])
	@page = Page.find_by_name('pictures')
  end
end
