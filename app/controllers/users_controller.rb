class UsersController < ApplicationController
  def index
  	# get all users here
  	@users = User.all
  end

  # By Rails resourceful routing, format is /users/:id
  def show
  	# get particular user here
  	@user = User.find_by_id(params[:id])
  	# if not @user
  	# 	redirect_to "/users"
  	# end
  end

  def check_mobile_login
    token = params[:token]

    user = FbGraph::User.me(token)
    user = user.fetch

    logged_in_user = User.find_by_uid(user.identifier)

    puts "We are inside of check_mobile_login"
    puts "Here is the logged_in_user"
    puts logged_in_user
    puts "The logged in user's name is"
    puts logged_in_user.name
    puts "The logged in user's email is "
    puts logged_in_user.email

    if logged_in_user
      sign_in(:user, logged_in_user)
    end

    respond_to do |format|
      format.json { render :json => logged_in_user.authentication_token}
      format.html { render :json => logged_in_user.authentication_token}
    end
  end

end
