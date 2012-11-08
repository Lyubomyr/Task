class PhotoPicturesController < ApplicationController
  def index
	@page = Page.find_by_name('photo_pictures')
  end

  def show
	@photo_picture = PhotoPicture.find(params[:id])
	@photo_pictures = Picture.where('photo_picture_id = ?',
		@photo_picture.id).page(params[:page]).per(20)
  end
end
