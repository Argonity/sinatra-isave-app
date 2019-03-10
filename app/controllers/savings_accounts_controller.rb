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


end