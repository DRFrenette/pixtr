class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comments_params)
    @comments = @image.comments
    @gallery = @image.gallery
    if @comment.save 
      redirect_to gallery_image_path(@gallery, @image)
    else
      render "images/show"
      #redirect_to gallery_image_path(image.gallery, image)
    end
  end
  

  private
  
  def comments_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
