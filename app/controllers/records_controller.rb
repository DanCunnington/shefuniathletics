class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :update, :destroy]
  before_action :check_admin, except: [:index]
  

  # GET /records
  # GET /records.json
  def index
    @male_outdoors = Record.where(event_type: "Male Outdoor")
    @male_indoors = Record.where(event_type: "Male Indoor")
    @female_outdoors = Record.where(event_type: "Female Outdoor")
    @female_indoors = Record.where(event_type: "Female Indoor")

    #Background text
    background = InfoPage.where(key:"records_background")
    if background != []
      @background = InfoPage.find_by(key: "records_background").value

    else
      @background = "Content will appear shortly"
    end

    #Image next to background
    background_image = SiteImage.where(reference:"records_page")
    if (background_image != [])
      @background_image = SiteImage.find_by(reference:"records_page").image_url
    else
      @background_image = []
    end

    #Cross Country records
    cross_country_male = InfoPage.where(key: "cross_country_male_records")
    if cross_country_male != []
      @cross_country_male = InfoPage.find_by(key: "cross_country_male_records").value
    else
      @cross_country_male = "Content will appear shortly"
    end

    cross_country_female = InfoPage.where(key: "cross_country_female_records")
    if cross_country_female != []
      @cross_country_female = InfoPage.find_by(key: "cross_country_female_records").value
    else
      @cross_country_female = "Content will appear shortly"
    end

    #Road records
    road_marathon = InfoPage.where(key: "road_marathon_records")
    if road_marathon != []
      @road_marathon = InfoPage.find_by(key: "road_marathon_records").value
    else
      @road_marathon = "Content will appear shortly"
    end 

    road_10k = InfoPage.where(key: "road_10k_records")
    if road_10k != []
      @road_10k = InfoPage.find_by(key: "road_10k_records").value
    else
      @road_10k = "Content will appear shortly"
    end 


    


  end

 
  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        flash[:success] = "Record Created."
        format.html { redirect_to admin_records_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        flash[:success] = "Record Updated."
        format.html { redirect_to admin_records_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    flash[:danger] = "Record Deleted."
    respond_to do |format|
      format.html { redirect_to admin_records_path }
      format.json { head :no_content }
    end
  end


  def admin
     @female_outdoors = Record.where(event_type: "Male Outdoor")
    @female_indoors = Record.where(event_type: "Male Indoor")
    @fefemale_outdoors = Record.where(event_type: "Fefemale Outdoor")
    @fefemale_indoors = Record.where(event_type: "Fefemale Indoor")
  end

  def sort
    params[:order].each do |key,value|
      Record.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:event, :event_type, :athlete, :time, :competition)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
