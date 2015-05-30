class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :check_admin

  # GET /event
  # GET /event.json
  def index
    @events = Event.all
  end

 
  # GET /events/new
  def new
    @event= Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        flash[:success] = "Event Created."
        format.html { redirect_to events_path }
        format.json { render action: 'index', status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update

    respond_to do |format|
      if @event.update(event_params)
        flash[:success] = "Event Updated."
        format.html { redirect_to events_path}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    flash[:danger] = "Event Deleted."
    respond_to do |format|
      format.html { redirect_to events_path }
      format.json { head :no_content }
    end
  end

  def sort
    params[:order].each do |key,value|
      Event.find(value[:id]).update_attribute(:priority,value[:position])
    end
    render :nothing => true
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event= Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description)
    end

    def check_admin
      redirect_to(root_url) unless current_admin_user
    end 
    
end
