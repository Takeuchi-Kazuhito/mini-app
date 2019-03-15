class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order("id desc")
    @comment = Comment.new

  end

  def new
    @tweet = Tweet.new
  end

  def create
    # tweet = Tweet.create(tweet_params)
    tweet = Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    if tweet.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end


  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
    # @comments = @tweet.comments.includes(:user)
  end

  private
  # def tweet_params
  #   params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  # end

  def tweet_params
    params.permit(:image, :text)
  end


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
