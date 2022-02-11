class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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