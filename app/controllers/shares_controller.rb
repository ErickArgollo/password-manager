class SharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password

  def new 
    @users = User.all.excluding(current_user)
  end

  def create
  end

  def destroy
  end

  private 

  def set_password
    @password = current_user.passwords.find(params[:password_id])
  end
end