class SessionsController < ApplicationController
  layout "sessions"
def new
end

def create
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to "/requests", :notice => "Conectado!"
  else
    redirect_to root_url, :notice => "Correo o contraseña incorrecto!"
    
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Sesion cerrada!"
end

end
