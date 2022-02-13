class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    # Generate password reset token for password reset
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)

    mail to: params[:user].email
  end
end


# To create a reset token go to rails c
# user.signed_id(expires_in 15.minutes, purpose: "password_rest")
# The user.signed_id provides a reset token. You can pass parameters in
# experies_in sets the expiration date 
# purpose allows us to set the purpose of the reset token which in this case is password_reset this 
# This allows the server to only accept signed IDs for the purpose of password_rest