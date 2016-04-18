class ImportsController < ApplicationController
  def new

  end

  def create
    respond_with(Import.new(params[:username], params[:repo]).import!) do |format|
      format.html { redirect_to commits_path }
    end
  end

  private
  def interpolation_options
    {resource_name: 'Commits List'}
  end
end
