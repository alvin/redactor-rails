class RedactorRails::DocumentsController < ApplicationController

  def index
    @documents = RedactorRails.document_model.where({ })
    render :json => @documents.to_json
  end

  def create
    @document = RedactorRails.document_model.new

    file = params[:file]
    @document.data = RedactorRails::Http.normalize_param(file, request)

    if @document.save
      render :text => { :filelink => @document.url, :filename => @document.filename }.to_json
    else
      render :nothing => true
    end
  end

  private

end
