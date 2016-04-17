class CommitsController < ApplicationController

  def index
    @commits = Commit.order(:date).page params[:page]
    respond_with(@commits)
  end

end
