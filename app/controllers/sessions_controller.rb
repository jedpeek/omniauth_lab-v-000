class SessionsController < ApplicationController

  def create
    if auth_hash = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth[:uid])
        user.name = auth['info']['name']
        session[:user_id] = user.try.id
      return redirect_to controller:'sessions', action:'create'
    else
      render 'sessions/new'
      end
    end


    def create
      user = User.find_or_create_by(:uid => auth['uid']) do |user|
        user.name = auth['info']['name']
      end
      session[:user_id] = user.try(:id)
    end

    def auth
      request.env['omniauth.auth']
    end

end
