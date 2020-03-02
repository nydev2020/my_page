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

  def comments
    @comment = Comment.new
    if Comment.create(comment_params)
      redirect_to admin_blog_path(blog.id)
    else
      redirect_to root_path
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
      redirect_to action: :index
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

  def comment_params
    params.require(:comments).permit(:comment).merge(user_id: current_user.id, blog_id: params[:blog_id])
  end
end
