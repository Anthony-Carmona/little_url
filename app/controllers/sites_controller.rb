class SitesController < ApplicationController
  before_action :set_site, only: %i[ show update destroy ]

  # GET /sites
  def index
    @sites = Site.all

    render json: @sites
  end

  # GET /sites/1
  def show
    render json: @site
  end

  # POST /sites
  def create
    begin
      URI.parse(site_params[:long_url])
    rescue
      render json: {error: "not a valid url", status: 400}, status: :bad_request
      return
    end
    
    @site = Site.new(site_params)

    if @site.save
      render json: @site, status: :created, location: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sites/1
  def update
    if @site.update(site_params)
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sites/1
  def destroy
    @site.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find_by(little_url: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:long_url, :little_url)
    end
end
