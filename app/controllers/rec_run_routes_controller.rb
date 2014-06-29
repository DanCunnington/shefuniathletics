class RecRunRoutesController < ApplicationController
  before_action :set_rec_run_route, only: [:edit, :update, :destroy]
  before_action :check_admin, except: [:index]

  # GET /rec_run_routes
  # GET /rec_run_routes.json
  def index
    @rec_run_routes = RecRunRoute.all
  end

 
  # GET /rec_run_routes/new
  def new
    @rec_run_route = RecRunRoute.new
  end

  # GET /rec_run_routes/1/edit
  def edit
  end

  # POST /rec_run_routes
  # POST /rec_run_routes.json
  def create
    @rec_run_route = RecRunRoute.new(rec_run_route_params)

    respond_to do |format|
      if @rec_run_route.save
        flash[:success] = "Recreational Run Route Created."
        format.html { redirect_to admin_rec_run_routes_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @rec_run_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rec_run_routes/1
  # PATCH/PUT /rec_run_routes/1.json
  def update
    respond_to do |format|
      if @rec_run_route.update(rec_run_route_params)
        flash[:success] = "Recreational Run Route Updated."
        format.html { redirect_to admin_rec_run_routes_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rec_run_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rec_run_routes/1
  # DELETE /rec_run_routes/1.json
  def destroy
    @rec_run_route.destroy
    flash[:danger] = "Recreational Run Route Deleted."
    respond_to do |format|
      format.html { redirect_to admin_rec_run_routes_path }
      format.json { head :no_content }
    end
  end


  def admin
    @rec_run_routes = RecRunRoute.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rec_run_route
      @rec_run_route = RecRunRoute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rec_run_route_params
      params.require(:rec_run_route).permit(:name, :distance, :difficulty, :description, :google_maps_link)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
