class SessionController < ApplicationController
  # loggin in
  def new
  end

  # handle the post from the login page
  def create
    # Extract the email and password from the params
    email = params[:email]
    password = params[:password]

    # find the user by their email
    user = User.find_by(email :email)

    # if we found a user and their password checks out
    if user && user.authenticate(password)
      # save the user_id in the session cookie
      session[:user_id] = user.id

      # logged in!
      redirect_to root_path
    else
      # something went wrong
      redirect_to login_path
    end
  end

  # logout
  def destroy
  # remove their user_id from the session
  session[:user_id] = nil
  redirect_to root_path
  end
end
