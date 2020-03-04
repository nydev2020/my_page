class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @blog = Blog.all.order("created_at DESC")
    @time = Time.new
    @yesterday = Time.now.yesterday
    @images = ActiveStorage::Attachment.order("created_at DESC").limit(9).pluck(:record_id)
    @gallery = Gallery.where(id: @images).order("created_at DESC")
  end
end
