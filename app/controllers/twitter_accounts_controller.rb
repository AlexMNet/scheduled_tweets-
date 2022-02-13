class TwitterAccountsController < ApplicationController
  before_action :require_login!
  # see #1
  before_action :set_twitter_account, only: [:show, :destroy]

  def index
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    @twitter_account.destroy
    redirect_to twitter_accounts_path, notice: "Successfully disconnected @#{@twitter_account.username}"
  end

  private

  def set_twitter_account
    @twitter_account = Current.user.twitter_accounts.find(params[:id])
  end
end

# 1 If we were to have a show, edit, update etc page we would be setting the twitter_account in each of those methods
# So to keep our code DRY we can create a private method in this case set_twitter_account and put the logic in that method
# We can then run that method in a beofre action for the specific methods that require it. 