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

  #GET action to render show page of individual savings account
  get '/savings/:id' do
    if logged_in?
      @savings = SavingsAccount.find_by_id(params[:id])
      if @savings
        erb :'savings_accounts/show'
      end
    else
      redirect to '/login'
    end
  end

  #GET action to render edit page of individual savings account
  get '/savings/:id/edit' do
    if logged_in?
      @savings = SavingsAccount.find_by_id(params[:id])
      @user = User.find_by_id(session[:user_id])
      if @savings && @savings.user == @user
        erb :'savings_accounts/edit'
      else
        redirect to '/savings'
      end
    else
      redirect to '/login'
    end
  end

  #PATCH action to edit individual savings account
  patch '/savings/:id' do
    if logged_in?
      if params[:item] == "" || params[:price] == "" || params[:amount_saved] == "" || params[:priority_level] == ""
        redirect to "/savings/#{params[:id]}/edit"
      else
        @savings = SavingsAccount.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        if @savings && @savings.user == @user
          if @savings.update(item: params[:item], price: params[:price], amount_saved: params[:amount_saved], priority_level: params[:priority_level])
            redirect to "/savings/#{@savings.id}"
          else 
            redirect to "/savings/#{@savings.id}/edit"
          end
        else 
          redirect to '/savings'
        end
      end
    else 
      redirect to '/login'
    end
  end

  


end