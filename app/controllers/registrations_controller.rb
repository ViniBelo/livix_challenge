class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to User.new
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.required(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
