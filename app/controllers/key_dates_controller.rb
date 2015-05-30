class KeyDatesController < ApplicationController
  before_action :set_key_date, only: [:edit, :update, :destroy]
  before_action :check_admin

  # GET /key_date
  # GET /key_date.json
  def index
    @key_dates = KeyDate.all
  end

 
  # GET /key_datees/new
  def new

    @key_date= KeyDate.new
  end

  # GET /key_dates/1/edit
  def edit
  end

  # POST /key_dates
  # POST /key_dates.json
  def create
    @key_date = KeyDate.new(key_date_params)

    respond_to do |format|
      if @key_date.save
        flash[:success] = "Key Date Created."
        format.html { redirect_to key_dates_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @key_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_dates/1
  # PATCH/PUT /key_dates/1.json
  def update

    respond_to do |format|
      if @key_date.update(key_date_params)
        flash[:success] = "Key Date Updated."
        format.html { redirect_to key_dates_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @key_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_dates/1
  # DELETE /key_dates/1.json
  def destroy

    @key_date.destroy
    flash[:danger] = "Key Date Deleted."
    respond_to do |format|
      format.html { redirect_to key_dates_path }
      format.json { head :no_content }
    end
  end

  def sort
    params[:order].each do |key,value|
      KeyDate.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key_date
      @key_date= KeyDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_date_params
      params.require(:key_date).permit(:description)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
