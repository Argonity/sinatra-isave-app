require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'my_first_sinatra_app'
  end

  get '/' do
    erb :index
  end

  # Helper methods to validate whether a user is logged in
  helpers do 
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
    end
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end
	end

end
