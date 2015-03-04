class UserInRequestsController < ApplicationController
  before_action :set_user_in_request, only: [:show, :edit, :update, :destroy]

  # GET /user_in_requests
  # GET /user_in_requests.json
  def index
		if current_user.id == 1
    	@user_in_requests = UserInRequest.all
		else
			redirect_to requests_path
		end
  end

  # GET /user_in_requests/1
  # GET /user_in_requests/1.json
  def show
  end

  # GET /user_in_requests/new
  def new
		if current_user.id == 1
	    @user_in_request = UserInRequest.new
		else
			redirect_to requests_path
		end
  end

  # GET /user_in_requests/1/edit
  def edit
  end

  # POST /user_in_requests
  # POST /user_in_requests.json
  def create
		if current_user.id == 1
		  @user_in_request = UserInRequest.new(user_in_request_params)

		  respond_to do |format|
		    if @user_in_request.save
		      format.html { redirect_to @user_in_request, notice: 'La propuesta del usuario fue creada exitosamente.' }
		      format.json { render action: 'show', status: :created, location: @user_in_request }
		    else
		      format.html { render action: 'new' }
		      format.json { render json: @user_in_request.errors, status: :unprocessable_entity }
		    end
		  end
		else
			redirect_to requests_path
		end
  end

  # PATCH/PUT /user_in_requests/1
  # PATCH/PUT /user_in_requests/1.json
  def update
		if current_user.id == 1
		  respond_to do |format|
		    if @user_in_request.update(user_in_request_params)
		      format.html { redirect_to @user_in_request, notice: 'La propuesta del usuario ha sido actualizada.' }
		      format.json { head :no_content }
		    else
		      format.html { render action: 'edit' }
		      format.json { render json: @user_in_request.errors, status: :unprocessable_entity }
		    end
		  end
		else
			redirect_to requests_path
		end
  end

  # DELETE /user_in_requests/1
  # DELETE /user_in_requests/1.json
  def destroy
		if current_user.id == 1
		  @user_in_request.destroy
		  respond_to do |format|
		    format.html { redirect_to user_in_requests_url }
		    format.json { head :no_content }
		  end
		else
			redirect_to requests_path
		end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_in_request
      @user_in_request = UserInRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_in_request_params
      params.require(:user_in_request).permit(:user_id, :request_id)
    end
end
