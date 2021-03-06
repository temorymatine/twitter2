class LikesController < ApplicationController

  before_action :set_user_session

  def index
    
  end

  def show

  end

  def new
    @like = Like.new
  end

  def create
    #params[:like][:user_id, :tweet_id]
    #   Like.create(user_id: .id, tweet_id: tweet.id)
    
    @like = Like.create(user_id: @username["id"], tweet_id: Tweet.find(params[:format]).id)
    #byebug
    redirect_back(fallback_location:"/")

    #@like = Like.create(like_params)

  end

  def destroy

    @tweet= Tweet.find(params[:id])
    @like = Like.find_by(user_id: @username["id"], tweet_id: @tweet.id)
    #Tweet.find(params[:format]).id)
    @like.destroy
    redirect_back(fallback_location:"/")
  end


  private
  def like_params
    params.require(:like).permit(:user_id, :tweet_id)
  end

  def set_user_session
    @username = session[:user]
  end

end
