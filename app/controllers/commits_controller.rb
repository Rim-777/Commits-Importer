class CommitsController < ApplicationController
  before_action :set_user

  def index
    @commits = (@user ? @user.commits : Commit).order(:date).page params[:page]
    respond_with(@commits)
  end

  private
  def set_user
    @user = User.find_by(email: params[:email]) if params[:email]
  end
end
