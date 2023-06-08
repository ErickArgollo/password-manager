class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @passwords = current_user.passwords
  end

  def new
    @password = Password.new
  end
  
end