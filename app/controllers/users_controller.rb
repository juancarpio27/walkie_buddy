class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to authenticated_root_path
    else
      puts(@user.errors.first)
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_password
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :lastname, :phone, :avatar)
  end


end
