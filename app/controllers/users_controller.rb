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

end
