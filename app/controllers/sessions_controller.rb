class SessionsController < ApplicationController

  def create
      auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth_hash[:uid])
        user.name = auth_hash['info']['name']
        session[:user_id] = user.try(:id)
      return redirect_to controller:'sessions', action:'create'
    end

end
