class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password

  def new
    @users = User.excluding(@password.users)
    @user_password = UserPassword.new
  end

  def create
    @user_password = @password.user_passwords.new(user_password_params)
    if @user_password.save
      redirect_to @password
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @password.user_passwords.where(user_id: params[:id]).destroy_all
    redirect_to @password
  end

  private

  def set_password
    @password = current_user.passwords.find(params[:password_id])
  end

  def user_password_params
    params.require(:user_password).permit(:user_id)
  end
end
