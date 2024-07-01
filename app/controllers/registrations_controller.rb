class RegistrationsController < ApplicationController
  def new
    @user = User.new
    @user.build_user_detail
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.required(:user).permit(:name, :email, :password, :password_confirmation, user_detail_attributes: [:name])
    end
end
