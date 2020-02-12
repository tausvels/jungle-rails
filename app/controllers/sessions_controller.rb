class SessionsController < ApplicationController

  def new
    redirect_to root_path if current_user
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
    # if user && user.authenticate(params[:password]) <-- moved the logic to the class method
      # Saves the user id inside the browser cookie.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # Sends back to login on invalid credentials
      # if params[:email] || params[:password]
        flash[:notice] = "Invalid username/password combination"
        # redirect_to '/login'
      # end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Please sign in"
    redirect_to "/login"
  end

end
