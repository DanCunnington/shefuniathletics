class HistoricImagesController < ApplicationController
  before_action :set_historic_image, only: [:edit, :update, :destroy]
  before_action :check_admin

  # GET /historic_image
  # GET /historic_image.json
  def index
    @historic_images = HistoricImage.all
  end

 
  # GET /historic_images/new
  def new

    if params[:image_url].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_url])         
      raise "Invalid upload signature" if !preloaded.valid?
      @historic_image.image_url = preloaded.identifier
    end

    @historic_image= HistoricImage.new
  end

  # GET /historic_images/1/edit
  def edit
  end

  # POST /historic_images
  # POST /historic_images.json
  def create
    @historic_image = HistoricImage.new(historic_image_params)

    if @historic_image.image_url.include? "/"
      fullImage = @historic_image.image_url.split('/')

      @historic_image.image_url = fullImage[fullImage.length-1]

    end
    respond_to do |format|
      if @historic_image.save
        flash[:success] = "Historic Image Created."
        format.html { redirect_to historic_images_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @historic_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historic_images/1
  # PATCH/PUT /historic_images/1.json
  def update

    fullImage = params[:historic_image][:image_url].split('/')
    params[:historic_image][:image_url] = fullImage[fullImage.length-1]

    respond_to do |format|
      if @historic_image.update(historic_image_params)
        flash[:success] = "Historic Image Updated."
        format.html { redirect_to historic_images_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @historic_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historic_images/1
  # DELETE /historic_images/1.json
  def destroy



    @historic_image.destroy
    flash[:danger] = "Historic Image Deleted."
    respond_to do |format|
      format.html { redirect_to historic_images_path }
      format.json { head :no_content }
    end
  end

  def sort
    params[:order].each do |key,value|
      HistoricImage.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historic_image
      @historic_image= HistoricImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historic_image_params
      params.require(:historic_image).permit(:image_url)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
