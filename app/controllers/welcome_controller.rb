class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      redirect_to users_path
    else
      render 'index'
    end
  end
end
