class PasswordResetController < ApplicationController

  def new
  
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # send mail to the user if present
      PasswordMailer.with(user: @user).reset.deliver_now
      redirect_to root_path
    else
      redirect_to "password/reset"
    end
  end

  def edit
    @user = User.find_signed(params[:token] , purpose: "password_reset")
  end

  def update
    @user = User.find_signed(params[:token] , purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private 
    def password_params
      params.require(:user).permit(:password,:password_confirmation)
    end

end
