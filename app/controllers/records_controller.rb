class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :update, :destroy]
  before_action :check_admin, except: [:index]

  # GET /records
  # GET /records.json
  def index
    @male_outdoors = Record.where(event_type: "Male Outdoor").order(created_at: :asc)
    @male_indoors = Record.where(event_type: "Male Indoor").order(created_at: :asc)
    @female_outdoors = Record.where(event_type: "Female Outdoor").order(created_at: :asc)
    @female_indoors = Record.where(event_type: "Female Indoor").order(created_at: :asc)
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
     @male_outdoors = Record.where(event_type: "Male Outdoor")
    @male_indoors = Record.where(event_type: "Male Indoor")
    @female_outdoors = Record.where(event_type: "Female Outdoor")
    @female_indoors = Record.where(event_type: "Female Indoor")
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
