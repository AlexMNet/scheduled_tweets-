class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Sign user in by setting session user_id to the users id . *see Auth
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end


# Can't user regular variables in the instance methods bescause they get garbage collected and go away
# Use instance variables instead which have the @ symbol beofre them so they can be used in views
#Auth, you can use cookies but this can be tampered with. Rails provides 2 options, signed cookies and  session cookies
# session cookies is encrypted. Cannot be tampered with by the browswer. Can be set server side
