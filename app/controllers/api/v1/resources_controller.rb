class Api::V1::ResourcesController < ApplicationController
  include Response
  include ExceptionHandler
  # will remove in Phase2
  skip_before_action :verify_authenticity_token
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET api/v1/resources
  # GET api/v1/resources.json
  def index
    @resources = Resource.all
    json_response(@resources)
  end

  # GET api/v1/resources/1
  def show
    json_response(@resource)
  end

  # POST api/v1/resources
  def create
    @resource = Resource.create!(resource_params)
    json_response(@resource, :created)
  end
  
  # POST api/v1/resources/scrape
  def scrape
    @resource = Resource.scrape(params[:url])
    json_response(@resource, :created)
  end

  # PATCH/PUT api/v1/resources/1
  def update
    @resource.update(resource_params)
    head :no_content
  end

  # DELETE api/v1/resources/1
  def destroy
    @resource.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.permit(:title, :description, :url, :root_url, :host, :image_url)
    end
end
