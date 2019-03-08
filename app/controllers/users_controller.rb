class UsersController < ApplicationController
  
  #loads the signup page
  #see User Authentication in Sinatra lab
  get '/signup' do
    if logged_in?
      redirect to '/savings_account'
    else
      erb :'/users/create_user'
    end
  end  

  post '/signup' do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id #user is logged in
      redirect to '/savings_account'
    end
  end


end
