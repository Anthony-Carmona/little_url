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
    long_url = (Regexp.new('(?:f|ht)tps?://') =~ site_params[:long_url] ? "" : "http://") + site_params[:long_url]
    
    unless long_url =~ /\A#{URI::regexp}\z/
      render json: {error: "not a valid url", status: 400}, status: :bad_request
      return
    end
  
    @site = Site.find_or_create_by(long_url: long_url)

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

    def save
      unless(Regexp.new('(?:f|ht)tps?://') =~ site_params[:long_url])
        site_params[:long_url] = "http://" + site_params[:long_url]
        puts({site_params: site_params})
      end
    end
end
