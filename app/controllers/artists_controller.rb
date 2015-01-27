class ArtistsController < ApplicationController
	def index
	end

	def show
		@artist = Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
		@artist.build_user
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			flash[:success] = "New Artist Created"
			redirect_to @artist
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private 
		def artist_params
			# params.require(:artist).permit(:shop_name, :street_address, :city, :state,
			# 																:zip_code, user_attributes: [:id, :email,
			# 																															:name, :password])
			params.require(:artist).permit!
		end
end
