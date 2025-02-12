class UsersController < ApplicationController
  before_action :set_user, only: %i[index update deposit send_money]

  def index
    set_user
    check_session
  end

  def edit
    set_user
    check_session
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Profile updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_user
    @user.destroy
    session[:user_id] = nil
    redirect_to signin_path
  end

  def deposit
    user = User.find_by(id: session[:user_id])
    amount = params[:amount].to_r

    ActiveRecord::Base.transaction do
      user.user_detail.deposit(amount)
    end
    redirect_to root_path
  end

  def send_money
    amount = params[:amount].to_r

    ActiveRecord::Base.transaction do
      @user.user_detail.transfer(params[:receiver], amount)
      raise ActiveRecord::Rollback unless @user.user_detail.errors.empty?
    end

    if @user.user_detail.errors.empty?
      redirect_to root_path
    else
      @users = User.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_user
    return unless session[:user_id]

    @user = User.find_by(id: session[:user_id])
  end

  def check_session
    if @user
      @users = User.all
    else
      redirect_to signin_path
    end
  end

  def user_params
    params.required(:user).permit(:name, :email, :password, :password_confirmation,
                                  user_detail_attributes: %i[id name])
  end
end
