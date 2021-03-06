class SessionsController < ApplicationController

  # SIGN IN
  def new
  end

  def create
    user = User.find_by(email_address: params[:session][:email_address].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to home_path
    else
      # Create an error message and re-render the signin form.
      flash[:error]='invalid email address/password combination'
      redirect_to signin_path
    end
  end

  # SIGN OUT
  def destroy
    sign_out
    redirect_to signin_path
  end

end
