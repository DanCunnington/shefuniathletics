class SiteImagesController < ApplicationController
  before_action :set_site_image, only: [:edit, :update, :destroy]
  before_action :check_admin
  before_action :check_super_admin, only: [:new, :create, :destroy]

  # GET /site_image
  # GET /site_image.json
  def index
    @site_images = SiteImage.all
  end

 
  # GET /site_images/new
  def new

    if params[:image_url].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_url])         
      raise "Invalid upload signature" if !preloaded.valid?
      @site_image.image_url = preloaded.identifier
    end
    @site_image= SiteImage.new
  end

  # GET /site_images/1/edit
  def edit
  end

  # POST /site_images
  # POST /site_images.json
  def create
    @site_image = SiteImage.new(site_image_params)

    if @site_image.image_url.include? "/"
      fullImage = @site_image.image_url.split('/')

      @site_image.image_url = fullImage[fullImage.length-1]

    end
    respond_to do |format|
      if @site_image.save
        flash[:success] = "Site Image Record Created."
        format.html { redirect_to site_images_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @site_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_images/1
  # PATCH/PUT /site_images/1.json
  def update

    fullImage = params[:site_image][:image_url].split('/')
    params[:site_image][:image_url] = fullImage[fullImage.length-1]

    respond_to do |format|
      if @site_image.update(site_image_params)
        flash[:success] = "Site Image Record  Updated."
        format.html { redirect_to site_images_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_images/1
  # DELETE /site_images/1.json
  def destroy

    @site_image.destroy
    flash[:danger] = "Site Image Record Deleted."
    respond_to do |format|
      format.html { redirect_to site_images_path }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_image
      @site_image= SiteImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_image_params
      params.require(:site_image).permit(:reference, :image_url)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 

    def check_super_admin
      redirect_to(root_url) unless current_admin_user.super_admin
    end
    
end
