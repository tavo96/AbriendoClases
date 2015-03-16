class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
		if current_user.id == 1
	    @schedules = Schedule.all
		else
			redirect_to requests_path
		end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
		if current_user.id == 1
    	@schedule = Schedule.new
		else
			redirect_to requests_path
		end
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
		if current_user.id == 1
		  @schedule = Schedule.new(schedule_params)

		  respond_to do |format|
		    if @schedule.save
		      format.html { redirect_to @schedule, notice: 'El horario fue creado exitosamente.' }
		      format.json { render action: 'show', status: :created, location: @schedule }
		    else
		      format.html { render action: 'new' }
		      format.json { render json: @schedule.errors, status: :unprocessable_entity }
		    end
		  end
		else
			redirect_to requests_path
		end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
		if current_user.id == 1
		  respond_to do |format|
		    if @schedule.update(schedule_params)
		      format.html { redirect_to @schedule, notice: 'El horario ha sido actualizado.' }
		      format.json { head :no_content }
		    else
		      format.html { render action: 'edit' }
		      format.json { render json: @schedule.errors, status: :unprocessable_entity }
		    end
		  end
		else 
			redirect_to requests_path
		end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
		if current_user.id == 1
		  @schedule.destroy
		  respond_to do |format|
		    format.html { redirect_to schedules_url }
		    format.json { head :no_content }
		  end
		else
			redirect_to requests_path
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:name)
    end
end
