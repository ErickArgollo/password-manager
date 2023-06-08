class PasswordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password, only: [:show, :update, :destroy]

  def index
    @passwords = current_user.passwords
  end

  def new
    @password = Password.new
  end

  def show 
  end

  def create
    @password = current_user.passwords.create(password_params)
    if @password.persisted?
      redirect_to @password
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:password).permit(:url, :username, :password)
  end

  def set_password
    @password = current_user.passwords.find(params[:id])
  end
end
