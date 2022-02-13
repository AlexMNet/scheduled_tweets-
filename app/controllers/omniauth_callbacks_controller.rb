class OmniauthCallbacksController < ApplicationController
  def twitter
    Rails.logger.debug auth
    # user ID will automatically be set since the user and twitter_accounts models are connected by i.e belongs_to, has_many
    # See if twitter_account exists if not initialize it.
    twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
      # these values are coming from the auth method defined bellow
    twitter_account.update(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )
    redirect_to twitter_accounts_path, notice: "successfully connected your account"
  end

  def auth
    request.env['omniauth.auth']
  end
end

