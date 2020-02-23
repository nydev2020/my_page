class Admin::BlogsController < ApplicationController
  
  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
  end

  private
  def blog_params
  end
end
