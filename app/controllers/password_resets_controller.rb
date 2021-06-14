class PasswordResetsController < ApplicationController
  def def new
    #   @ = .new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_now
    else
    end
    redirect_to root_path, notice: 'If an account with that link was found, we sent a link to reset your password.'
  end
  
end