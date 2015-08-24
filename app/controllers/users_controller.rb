class UsersController < ApplicationController

	def index
	 @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @place = @user.places

    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
end