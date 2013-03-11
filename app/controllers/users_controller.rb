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

    respond_to do |format|
      format.json { render :json => logged_in_user.authentication_token}
      format.html { render :json => logged_in_user.authentication_token}
    end
  end

end
