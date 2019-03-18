require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'my_first_sinatra_app'
  end

  get '/' do
    if logged_in?
      @savings = current_user.savings_accounts
      erb :index
    else
      erb :index
    end
  end

  # Helper methods
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

    def add_commas(amount)
      amount.reverse.scan(/\d{3}|.+/).join(",").reverse
    end

	end

end
