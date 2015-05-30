class CoachesController < ApplicationController
  before_action :set_coach, only: [:edit, :update, :destroy]
  before_action :check_admin

  # GET /coach
  # GET /coach.json
  def index
    @coaches = Coach.all
  end

 
  # GET /coaches/new
  def new

    if params[:image_url].present?
      preloaded = Cloudinary::PreloadedFile.new(params[:image_url])         
      raise "Invalid upload signature" if !preloaded.valid?
      @coach.image_url = preloaded.identifier
    end

    @coach= Coach.new
  end

  # GET /coaches/1/edit
  def edit
  end

  # POST /coaches
  # POST /coaches.json
  def create
    @coach = Coach.new(coach_params)

    fullImage = @coach.image_url.split('/')

    @coach.image_url = fullImage[fullImage.length-1]

    respond_to do |format|
      if @coach.save
        flash[:success] = "Coach Created."
        format.html { redirect_to coaches_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coaches/1
  # PATCH/PUT /coaches/1.json
  def update
    respond_to do |format|
      if @coach.update(coach_params)
        flash[:success] = "Coach Updated."
        format.html { redirect_to coaches_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coaches/1
  # DELETE /coaches/1.json
  def destroy
    @coach.destroy
    flash[:danger] = "Coach Deleted."
    respond_to do |format|
      format.html { redirect_to coaches_path }
      format.json { head :no_content }
    end
  end

  def sort
    params[:order].each do |key,value|
      Coach.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coach
      @coach= Coach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coach_params
      params.require(:coach).permit(:role, :name, :image_url, :description)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
