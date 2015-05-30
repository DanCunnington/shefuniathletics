class KitItemsController < ApplicationController
  before_action :set_kit_item, only: [:edit, :update, :destroy]
  before_action :check_admin

  # GET /kit_item
  # GET /kit_item.json
  def index
    @kit_items = KitItem.all
  end

 
  # GET /kit_items/new
  def new

    if params[:image_url].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_url])         
      raise "Invalid upload signature" if !preloaded.valid?
      @kit_item.image_url = preloaded.identifier
    end

    @kit_item= KitItem.new
  end

  # GET /kit_items/1/edit
  def edit
  end

  # POST /kit_items
  # POST /kit_items.json
  def create
    @kit_item = KitItem.new(kit_item_params)

    fullImage = @kit_item.image_url.split('/')

    @kit_item.image_url = fullImage[fullImage.length-1]

    respond_to do |format|
      if @kit_item.save
        flash[:success] = "Kit Item Created."
        format.html { redirect_to kit_items_path }
        format.json { render action: 'index', status: :created }
      else

        format.html { render action: 'new' }
        format.json { render json: @kit_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kit_items/1
  # PATCH/PUT /kit_items/1.json
  def update

    fullImage = params[:kit_item][:image_url].split('/')
    params[:kit_item][:image_url] = fullImage[fullImage.length-1]

    respond_to do |format|
      if @kit_item.update(kit_item_params)
        flash[:success] = "Kit Item Updated."
        format.html { redirect_to kit_items_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kit_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kit_items/1
  # DELETE /kit_items/1.json
  def destroy

    @kit_item.destroy
    flash[:danger] = "Kit Item Deleted."
    respond_to do |format|
      format.html { redirect_to kit_items_path }
      format.json { head :no_content }
    end
  end

  def sort
    puts "********************************************************"
    puts params[:order]
    puts "********************************************************"
    params[:order].each do |key,value|
      KitItem.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kit_item
      @kit_item= KitItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kit_item_params
      params.require(:kit_item).permit(:name, :image_url, :url)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
