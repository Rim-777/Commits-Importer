class ImportsController < ApplicationController

  def new
  end

  def create
      begin
        respond_with(Import.new(params[:username], params[:repo]).import!) do |format|
          format.html { redirect_to commits_path }
        end
      rescue => e
        flash[:alert] =  e.message
        render :new
      end
  end

  private
  def interpolation_options
    {resource_name: 'Request'}
  end
end
