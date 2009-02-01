class PublicationsController < ApplicationController
  # GET /publications
  # GET /publications.xml
  def index
    @publications = Publication.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @publications }
    end
  end
end
