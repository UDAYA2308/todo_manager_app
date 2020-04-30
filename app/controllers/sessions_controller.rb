class SessionsController < ApplicationController
  skip_before_action :ensure_user_login

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    end
  end


  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end

end