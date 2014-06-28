class FixturesController < ApplicationController
  before_action :set_fixture, only: [:edit, :update, :destroy]
  before_action :check_admin, except: [:index]

  # GET /fixtures
  # GET /fixtures.json
  def index
    @fixtures = Fixture.all
  end

 
  # GET /fixtures/new
  def new
    @fixture = Fixture.new
  end

  # GET /fixtures/1/edit
  def edit
  end

  # POST /fixtures
  # POST /fixtures.json
  def create
    @fixture = Fixture.new(fixture_params)

    respond_to do |format|
      if @fixture.save
        flash[:success] = "Fixture Created."
        format.html { redirect_to admin_fixtures_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixtures/1
  # PATCH/PUT /fixtures/1.json
  def update
    respond_to do |format|
      if @fixture.update(fixture_params)
        flash[:success] = "Fixture Updated."
        format.html { redirect_to admin_fixtures_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fixture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixtures/1
  # DELETE /fixtures/1.json
  def destroy
    @fixture.destroy
    flash[:danger] = "Fixture Deleted."
    respond_to do |format|
      format.html { redirect_to admin_fixtures_path }
      format.json { head :no_content }
    end
  end


  def admin
    @fixtures = Fixture.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixture
      @fixture = Fixture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fixture_params
      params.require(:fixture).permit(:name, :date, :location, :result_link)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
