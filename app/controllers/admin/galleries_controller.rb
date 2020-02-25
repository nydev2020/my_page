class Admin::GalleriesController < ApplicationController
  before_action :authenticate_user!
  def new
    @gallery = Gallery.new
  end

  def create
    Gallery.create(gallery_params)
    redirect_to root_path
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:id])
    gallery.update(gallery_params)
    redirect_to action: :edit
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
