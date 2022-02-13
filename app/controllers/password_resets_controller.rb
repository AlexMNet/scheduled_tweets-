class PasswordResetsController < ApplicationController
  def new
  end

  def create 
    @user = User.find_by(email: params[:email])
    if @user.present?
      # send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end 
      # redirect_to password_reset_edit_path
    redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password"
  end

  def edit 
    # Look up signed user, it will take token and look up user. It will also make sure token is not expired
    # Find signed has a bang (!) version that allows it to throw an error if the user is not found *** See #2
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to password_reset_path, alert: "Your token has expired. Please try again"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password was reset successfully. Please login"
    else
      render :edit
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
 


# This was create by using $ rails g mailer Password reset
# PasswordMailer.with(user: @user) sets up params in the mailer much like params in the controller. In our mailer controller we can then accesss the user as params[:user]
# reset is the name of the email in the passwordmailer. and we can set it to devliver_later or deliver_now
# deliver_later allows the user to see a quick response from the UI as the email will wait to send in the background
# deliver_now will send the email immediately but the UI will lag unitl the email is sent

#2 you can use the rescue method to catch the error and send the user back to the forgot your password page. 