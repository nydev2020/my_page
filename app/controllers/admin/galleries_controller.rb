class Admin::GalleriesController < ApplicationController
  before_action :authenticate_user!
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

  private
  def gallery_params
    params.require(:gallery).permit(:title, :text, :gallery).merge(user_id: current_user.id)
  end
end
