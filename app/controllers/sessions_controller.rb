class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      return redirect_to controller:'sessions', action:'create'
    else
      #standard login
      user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
      redirect_to controller:'sessions', action:'create'
        else
          render 'sessions/new'
        end
      end
    end

    def destroy
      reset_session
      redirect_to login_path
    end
end
