class HomesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @blog = Blog.all
  end
end
