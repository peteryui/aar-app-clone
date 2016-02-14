class MediaContentsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def create
    @media = Media.new(file_name: params[:file])
      if @media.save!
        respond_to do |format|
        format.json{ render :json => @media }
      end
    end
  end

end
