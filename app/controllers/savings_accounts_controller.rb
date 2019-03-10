class SavingsAccountsController < ApplicationController
  
  #GET action to render all savings accounts for existing user 
  get '/savings_account' do
    if logged_in?
      @savings = SavingsAccount.all
      erb :'/savings_accounts/index'
    else
      redirect '/login'
    end
  end



end