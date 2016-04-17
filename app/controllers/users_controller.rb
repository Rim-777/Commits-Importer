class UsersController < ApplicationController
before_action :set_user

  def update
    @user.update(user_params)
    # render nothing: true
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
