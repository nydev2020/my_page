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

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blig = Blog.find(params[:id])
    if blog.update{blog_params}
      redirect_to root_path
    else
      redirect_to action: :edit
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.destroy
      redirect_to root_path
    else
      redirect_to action: :edit
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id)
  end
end
