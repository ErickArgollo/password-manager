class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password

  def new 
    @users = User.all.excluding(current_user)
  end

  def create
    @user_password = @password.user_password.new(user_password_params)
    if @user_password.save
      redirect_to @password
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private 

  def set_password
    @password = current_user.passwords.find(params[:password_id])
  end

  def user_password_params
    params.require(:user_password).permit(:user_id)
  end
end