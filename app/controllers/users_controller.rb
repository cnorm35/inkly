class UsersController < ApplicationController
	#add before filter for following and followers

	def index
		@users = User.all
	end

	def show
  	@user = User.find(params[:id])
      if @user.profile_type == "Artist"
          @artist = Artist.find(current_user.profile_id)
          #redirect_to @artist
      end
	end

	def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

	def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end