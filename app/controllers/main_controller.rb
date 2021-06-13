class MainController < ApplicationController
  def index
    # flash[:notice] = "logged in successfully"
    # flash[:alert] = "invalid email or password"
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end
end
