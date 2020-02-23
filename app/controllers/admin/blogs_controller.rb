class Admin::BlogsController < ApplicationController
  
  def new
    @blog = Blog.new
  end

  def create
    if Blog.create(blog_params)
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id)
  end
end
