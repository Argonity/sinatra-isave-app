class UsersController < ApplicationController
  
  #if existing user, redirects to savings_account route
  #if new user, renders the signup page
  get '/signup' do
    if logged_in? #check if user is logged in with helper method
      redirect to '/savings_account' #redirect logged in user to savings account route
    else
      erb :'/users/create_user' 
    end
  end  

  #form action to retrieve new user signup info
  post '/signup' do #users signup with email and password only
    if params[:email] == "" || params[:password] == "" #check if email and password fields are blank
      redirect to '/signup'
    else
      @user = User.new(email: params[:email], password: params[:password]) #retrieve email and password from form and create new user 
      @user.save
      session[:user_id] = @user.id #user is now logged in
      redirect to '/savings_account' #redirect logged in user to savings account route
    end
  end


end
