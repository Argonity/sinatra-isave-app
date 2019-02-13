class NamEsController < ApplicationController

  # GET: /nam_es
  get "/nam_es" do
    erb :"/nam_es/index.html"
  end

  # GET: /nam_es/new
  get "/nam_es/new" do
    erb :"/nam_es/new.html"
  end

  # POST: /nam_es
  post "/nam_es" do
    redirect "/nam_es"
  end

  # GET: /nam_es/5
  get "/nam_es/:id" do
    erb :"/nam_es/show.html"
  end

  # GET: /nam_es/5/edit
  get "/nam_es/:id/edit" do
    erb :"/nam_es/edit.html"
  end

  # PATCH: /nam_es/5
  patch "/nam_es/:id" do
    redirect "/nam_es/:id"
  end

  # DELETE: /nam_es/5/delete
  delete "/nam_es/:id/delete" do
    redirect "/nam_es"
  end
end
