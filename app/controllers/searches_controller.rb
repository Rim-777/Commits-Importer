class SearchesController < ApplicationController

  def show

  end

  def create
    @commits = Search.new.search!(params[:email])
    respond_with(@commits) do |format|
      format.html { render :show }
    end
  end


  private
  def interpolation_options
    {resource_name: "Action"}
  end
end
