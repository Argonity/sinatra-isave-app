class SavingsAccountsController < ApplicationController
  
  #GET action to render all savings accounts for existing user 
  get '/savings' do
    if logged_in?
      @savings = SavingsAccount.all
      erb :'/savings_accounts/index'
    else
      redirect '/login'
    end
  end

  #GET action to render form to create a new savings account
  get '/savings/new' do
    if logged_in?
      erb :'/savings_accounts/new'
    else
      redirect '/login'
    end
  end

  #POST action to create a new savings account
  post '/savings' do
    if params[:item] == "" || params[:price] == "" || params[:amount_saved] == "" || params[:priority_level] == ""
      redirect '/savings/new'
    else
      @user = User.find_by_id(session[:user_id])
      SavingsAccount.create(item: params[:item], price: params[:price], amount_saved: params[:amount_saved], priority_level: params[:priority_level], user_id: @user.id)
    end
    redirect '/savings'
  end


end