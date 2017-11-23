class Api::V1::ResourcesController < ApplicationController
  include Response
  include ExceptionHandler
  # will remove in Phase2
  skip_before_action :verify_authenticity_token
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
    json_response(@resources)
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    json_response(@resources)
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.scrape(params[:resource][:url])
    if @resource.valid?
        @resource.save
        json_response(@resource, :created)
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    @resource.update(resource_params)
    head :no_content
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
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
      params.require(:resource).permit(:title, :description, :url, :root_url, :host, :image_url)
    end
end
