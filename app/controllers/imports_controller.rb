class ImportsController < ApplicationController
  def create
   Import.new(params[:username], params[:repo]).import!
    redirect_to commits_path
  end




end
