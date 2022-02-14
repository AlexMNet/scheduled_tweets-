class TweetsController < ApplicationController
  before_action :require_login!

  def index
    @tweets = Current.user.tweets
  end
  
  def new
    @Tweet = Tweet.new
  end

  def show
  end

  def destroy
  end
end