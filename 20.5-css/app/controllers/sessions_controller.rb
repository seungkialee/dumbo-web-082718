class SessionsController < ApplicationController


  #login form
  def new

  end



  def create
    @user = User.find_by(username: params[:username])
    if (@user && @user.authenticate(params[:password]))
      log_in_user(@user.id)
      flash[:message] = "You are logged in!"
      redirect_to colors_path
    else
      flash[:errors] = ["That didn't match anything we have in our database"]
      redirect_to new_session_path
    end
  end

  #logout
  def destroy
    log_out!
    redirect_to colors_path
  end


  private

  def not_fire_rod_rosenstein

  end
  
end