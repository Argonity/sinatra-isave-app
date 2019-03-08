class UsersController < ApplicationController
  
  #GET action to render signup form
  get '/signup' do
    if logged_in? #check if user is logged in with helper method
      redirect to '/savings_account' #redirect logged in user to savings account route
    else
      erb :'/users/create_user' 
    end
  end  

  #POST action to retrieve new user from signup form
  post '/signup' do #users signup with email and password only
    if params[:email] == "" || params[:password] == "" #check if email and password fields are blank
      redirect to '/signup'
    else
      @user = User.new(email: params[:email], password: params[:password]) #retrieve email and password from form and create new user 
      @user.save
      session[:user_id] = @user.id #login the user by enabling a session
      redirect to '/savings_account' #redirect logged in user to savings account route
    end
  end

  #GET action to render index page thru the savings_account route
  get '/login' do
    if !logged_in? #check if user is not logged in with helper method
      erb :'/users/login' #render login page
    else
      redirect '/savings_account' #redirect logged in user to savings account route
    end
  end

  #POST action to find existing user from login form
  post '/login' do
    @user = User.find_by(name: params[:name]) #find user by name
    if @user && @user.authenticate(params[:password]) #if user name and password found
      session[:user_id] = @user.id #login the user by enabling a session
      redirect '/savings_account'
    else
      redirect '/signup' #redirect to signup route if user not found
    end
  end


end
