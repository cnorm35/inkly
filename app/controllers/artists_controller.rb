class ArtistsController < ApplicationController
	def index
	end

	def show
		@artist = Artist.find(params[:id])
		business_name = { term: "#{@artist.shop_name}"}
		@yelp_data = Yelp.client.search("#{@artist.city}", business_name)
		#render json: @yelp_data
	end

	def new
		@artist = Artist.new
		@artist.build_user
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			flash[:success] = "New Artist Created"
			sign_in(@artist.user)
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
			params.require(:artist).permit(:shop_name, :street_address, :city, :state,
																			:zip_code, :latitude, :longitude, user_attributes: [:id, :email,
																																		:name, :password])
			#params.require(:artist).permit!
		end
end
