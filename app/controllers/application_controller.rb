require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #turns sessions ON
    set :session_secret, 'my_first_sinatra_app' 
    #encryption key used to create a session_id
    #session_id is a string of letters and numbers unique to a user's session and is stored in the browser cookie
  end

  get '/' do
    erb :index
  end

  # Helper methods
  helpers do 
		def logged_in?
			!!session[:user_id] #double bang converts value to a boolean
		end

		def current_user
			User.find(session[:user_id])
    end
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login"
      end
    end

    # def add_commas(amount)
    #   amount.reverse.scan(/\d{3}|.+/).join(",").reverse
    # end

	end

end
