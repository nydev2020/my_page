class HomesController < ApplicationController
  def index
    @blog = Blog.all
  end
end
