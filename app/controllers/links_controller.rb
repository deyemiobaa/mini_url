require 'securerandom'
class LinksController < ApplicationController
  before_action :create_new_slug, only: %i[ create ]

  # GET /links or /links.json
  def index
    @link = Link.new
    @links = Link.all
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # POST /links or /links.json
  def create
    @link = Link.new(link_params)
    @link.slug = create_new_slug if link_params[:slug].blank?
    respond_to do |format|
      if @link.save
        format.html { redirect_to links_path, notice: "Mini url was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity,  alert: "Mini url was not created." }
      end
    end
  end

  def redirect
    link = Link.find_by(slug: params[:slug])
    link.update_click_count
    redirect_to link.long_url, allow_other_host: true
  end

  private
    def create_new_slug
      SecureRandom.hex(5)
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:long_url, :slug)
    end
end
