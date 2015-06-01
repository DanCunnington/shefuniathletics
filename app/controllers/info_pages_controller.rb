class InfoPagesController < ApplicationController
  before_action :set_info_page, only: [:edit, :update, :destroy]
  before_action :check_admin
  before_action :check_super_admin, only: [:new, :create, :destroy]

  # GET /info_pages
  # GET /info_pages.json
  def index
    @info_pages = InfoPage.all
  end

   # GET /info_pages/1/edit
  def edit
  end

  def new
    @info_page= InfoPage.new
  end

  # POST /info_pages
  # POST /info_pages.json
  def create
    @info_page = InfoPage.new(info_page_params)

    respond_to do |format|
      if @info_page.save
        flash[:success] = "Content Created."
        format.html { redirect_to info_pages_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @info_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info_pages/1
  # PATCH/PUT /info_pages/1.json
  def update
    respond_to do |format|
      if @info_page.update(info_page_params)
        flash[:success] = "Content Updated."
        format.html { redirect_to info_pages_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @info_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_pages/1
  # DELETE /info_pages/1.json
  def destroy
    @info_page.destroy
    flash[:danger] = "Content Deleted."
    respond_to do |format|
      format.html { redirect_to info_pages_path }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_page
      @info_page = InfoPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_page_params
      params.require(:info_page).permit(:key, :value)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 

    def check_super_admin
      redirect_to(root_url) unless current_admin_user.super_admin
    end
    
end
