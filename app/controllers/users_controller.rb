class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]


 # GET /users
  # GET /users.json
  def index
	if current_user
		if current_user.id == 1
    	@users = User.all
		else
			redirect_to requests_path
		end
	else
	redirect_to log_in_path
	end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

	def edit
	end

	def new
	@search = User.find_by_id(1)
	if @search.blank?
		@user = User.new
	else
		if current_user
			if current_user.id == 1
  			@user = User.new
			else
				redirect_to requests_path
			end
		else
			redirect_to log_in_path
		end
	end
	end

	def create
  	@user = User.new(params[:user])
    @user.password = @user.cuenta
    @user.password_confirmation = @user.cuenta
 		if @user.save
	@user.save
  	  redirect_to users_path, :notice => "El usuario ha sido registrado!"
  	else
    	render "new"
  	end
	end

	def update
  	  respond_to do |format|
  	    if @user.update(user_params)
  	      format.html { redirect_to @user, notice: 'El usuario ha sido actualizado.' }
  	      format.json { head :no_content }
  	    else
  	      format.html { render action: 'edit' }
  	      format.json { render json: @user.errors, status: :unprocessable_entity }
  	    end
  	  end
  end

	private
    # Use callbacks to share common setup or constraints between actions.
		
    def set_user 
		if current_user 
			u = current_user.id
      @user = User.find(u)
		else
			redirect_to log_in_path
		end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :cuenta, :telefono, :informacion_adicional, :name)
    end

end
