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

  def send_picture
	session[:picture] ||= {}
	cat = PhotoPicture.find(params[:photo_picture_id]).id
	pic = PhotoPicture.find(params[:photo_picture_id]).
				pictures.find(params[:id]).id

	picture = {pic: pic, cat: cat}
	session[:picture].deep_merge!(picture) if params[:id]
	redirect_to new_picture_order_path
  end
end
