class CommitteePositionsController < ApplicationController
  before_action :set_committee_position, only: [:edit, :update, :destroy]
  before_action :check_admin

  # GET /committee_position
  # GET /committee_position.json
  def index
    @committee_positions = CommitteePosition.all
  end

 
  # GET /committee_positions/new
  def new

    if params[:image_url].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_url])         
      raise "Invalid upload signature" if !preloaded.valid?
      @committee_position.image_url = preloaded.identifier
    end

    @committee_position= CommitteePosition.new
  end

  # GET /committee_positions/1/edit
  def edit
  end

  # POST /committee_positions
  # POST /committee_positions.json
  def create
    @committee_position = CommitteePosition.new(committee_position_params)

    if @committee_position.image_url.include? "/"
      fullImage = @committee_position.image_url.split('/')

      @committee_position.image_url = fullImage[fullImage.length-1]
    end

    respond_to do |format|
      if @committee_position.save
        flash[:success] = "Committe Position Created."
        format.html { redirect_to committee_positions_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @committee_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committee_positions/1
  # PATCH/PUT /committee_positions/1.json
  def update

    #If image_url is different to database one, deltete old image from cloudinary
    fullImage = params[:committee_position][:image_url].split('/')
    new_image_url = fullImage[fullImage.length-1]
    params[:committee_position][:image_url] = fullImage[fullImage.length-1]

    if new_image_url != @committee_position.image_url

      #Delete old image from cloudinary
      #get public id from database
      public_id = @committee_position.image_url.split(".")[0]
      Cloudinary::Api.delete_resources([public_id])


    end

    respond_to do |format|
      if @committee_position.update(committee_position_params)
        flash[:success] = "Committee Position Updated."
        format.html { redirect_to committee_positions_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @committee_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committee_positions/1
  # DELETE /committee_positions/1.json
  def destroy

    #Delete image associated with this committee position
    #get public id from database
    public_id = @committee_position.image_url.split(".")[0]

    #Delete on cloudinary
    Cloudinary::Api.delete_resources([public_id])


    @committee_position.destroy
    flash[:danger] = "Committee Position Deleted."
    respond_to do |format|
      format.html { redirect_to committee_positions_path }
      format.json { head :no_content }
    end
  end

  def sort
    puts "********************************************************"
    puts params[:order]
    puts "********************************************************"
    params[:order].each do |key,value|
      CommitteePosition.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee_position
      @committee_position= CommitteePosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committee_position_params
      params.require(:committee_position).permit(:position, :name, :image_url, :description)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
