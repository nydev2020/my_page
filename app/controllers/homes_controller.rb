class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @blog = Blog.all
    @images = ActiveStorage::Attachment.order("created_at DESC").limit(9).pluck(:record_id)
    @gallery = Gallery.where(id: @images)
  end
end
