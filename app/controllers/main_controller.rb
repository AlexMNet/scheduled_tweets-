class MainController < ApplicationController
  def index

  end
end 


# User.find will throw an error if it can't find that user in the DB User.find(session[:user_id])
# Instead use User.find_by(id: session[:user_id]) this will not throw an error! And just treat the site as logged out. 