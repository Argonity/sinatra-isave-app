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




end
