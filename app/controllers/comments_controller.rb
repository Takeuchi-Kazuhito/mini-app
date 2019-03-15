class CommentsController < ApplicationController
  def create

    @comment = Comment.create(comment_params)
    redirect_to tweet_path(params[:tweet_id])

    # if comment.save
    #   redirect_to tweet_path(params[:tweet_id])
    # else

    # end

  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to tweet_path(params[:tweet_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
  end
end
