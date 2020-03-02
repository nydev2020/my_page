class Admin::CommentsController < ApplicationController
  # def create
  #   @comment = Comment.new(comment_params)
  #   if @comment.save
  #     redirect_to admin_blog_path(blog.id)
  #   else
  #     redirect_to root_path
  #   end
  # end

  # private
  # def comment_params
  #   params.require(:comment).permit(:comment).merge(user_id: current_user.id, blog_id: params[:blog_id])
    
  # end
end
