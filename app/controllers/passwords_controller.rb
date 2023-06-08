class PasswordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_password, except: [:index, :new, :create]
  before_action :check_editor_permission, only: [:edit, :update]
  before_action :check_deletable_permission, only: [:destroy]

  def index
    @passwords = current_user.passwords
  end

  def new
    @password = Password.new
  end

  def show
  end

  def create
    @password = Password.new(password_params)
    @password.user_passwords.new(user: current_user, role: :owner)

    if @password.save
      redirect_to @password
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @password.update(password_params)
      redirect_to @password
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @password.destroy
    redirect_to root_path
  end

  private

  def password_params
    params.require(:password).permit(:url, :username, :password)
  end

  def set_password
    @password = current_user.passwords.find(params[:id])
  end

  def check_editor_permission
    redirect_to @password unless current_user_password.editable?
  end

  def check_deletable_permission
    redirect_to @password unless current_user_password.editable?
  end
end
