class PicturesController < ApplicationController
  before_filter :get_category
  def index
	@pictures = Picture.where('picture_category_id = ?', params[:picture_category_id])
			.page(params[:page]).per(20)
  end

  def show
	@picture = Picture.find_by_id(params[:id])
  end

  private

  def get_category
	@picture_category=PictureCategory.find_by_id(params[:picture_category_id])
  end
end
