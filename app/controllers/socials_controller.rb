class SocialsController < ApplicationController
  before_action :set_social, only: [:edit, :update, :destroy]
  before_action :check_admin, except: [:index]

  # GET /socials
  # GET /socials.json
  def index
    @socials = Social.all.order(date: :asc)
    
  end

 
  # GET /socials/new
  def new
    @social = Social.new
    @onload = "dateFieldDefaultSocial();"
  end

  # GET /socials/1/edit
  def edit
  end

  # POST /socials
  # POST /socials.json
  def create
    @social = Social.new(social_params)

    respond_to do |format|
      if @social.save
        flash[:success] = "Social Created."
        format.html { redirect_to admin_socials_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /socials/1
  # PATCH/PUT /socials/1.json
  def update
    respond_to do |format|
      if @social.update(social_params)
        flash[:success] = "Social Updated."
        format.html { redirect_to admin_socials_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socials/1
  # DELETE /socials/1.json
  def destroy
    @social.destroy
    flash[:danger] = "Social Deleted."
    respond_to do |format|
      format.html { redirect_to admin_socials_path }
      format.json { head :no_content }
    end
  end


  def admin
    @socials = Social.all.order(date: :asc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social
      @social = Social.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_params
      params.require(:social).permit(:name, :date, :facebook_event_link)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
