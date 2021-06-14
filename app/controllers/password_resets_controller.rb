class PasswordResetsController < ApplicationController
  def def new
    #   @ = .new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    else
    end
    redirect_to root_path, notice: 'If an account with that link was found, we sent a link to reset your password.'
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your Token Has Expired, Please Try Again.'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password reset')
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Your password was reset successfully, please sign in.'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
