class Admin::BlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @blog = Blog.all.order("created_at DESC").page(params[:page]).per(9)
  end

  def new
    @blog = Blog.new
  end

  def create
    if Blog.create(blog_params)
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
    @comments = @blog.comments.includes(:user)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
      redirect_to root_path
    else
      redirect_to action: :edit
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.destroy
      redirect_to action: :index
    else
      redirect_to action: :edit
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id)
  end
end
