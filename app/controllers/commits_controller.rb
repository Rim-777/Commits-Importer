class CommitsController < ApplicationController

  def index
    @commits = Commit.order(:date).page params[:page]
  end

end
