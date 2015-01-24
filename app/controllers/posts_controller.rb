class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def edit
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Post was successfully created"
			redirect_to @post 
		else
			render action: "new"
		end
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to @post, flash[:success] =  "Post updeated"
		else
			render action "edit"
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:description, :image)
		end

end
