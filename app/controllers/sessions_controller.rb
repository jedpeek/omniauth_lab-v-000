class SessionsController < ApplicationController

  def create
    if auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      binding.pry
      return redirect_to controller:'sessions', action:'create'
    else
      render 'sessions/new'
      end
    end

end
