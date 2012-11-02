class PicturesController < ApplicationController
  def index
	@picture_category=PictureCategory.find_by_id(params[:picture_category_id])
	@pictures = Picture.where('picture_category_id = ?', params[:picture_category_id])
  end

  def show
	@picture = Picture.find_by_id(params[:id])
  end
end
