class Admin::GalleriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = ActiveStorage::Attachment.all.pluck(:record_id)
    @gallery = Gallery.where(id: @images).order("created_at DESC")
  end

  def new
    @gallery = Gallery.new
  end

  def create
    if Gallery.create(gallery_params)
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:id])
    if gallery.update(gallery_params)
      redirect_to root_path
    else
      redirect_to action: :edit
    end
  end

  private
  def gallery_params
    params.require(:gallery).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
