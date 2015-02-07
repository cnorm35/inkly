class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments.all
		@comment = @post.comments.build
	end

	def new
		@post = current_user.posts.build
	end

	def edit
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Created new post!"
			redirect_to @post
		else
			render action: "new"
		end
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Updated Post"
			redirect_to @posts
		else
			render action: "edit"
		end
	end

	def destroy
		@post.destroy
		flash[:danger] = "Post Deleted"
		redirect_to posts_path
	end

	def upvote
		@post.upvote_by current_user
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end

	end

	def downvote
		@post.downvote_by current_user
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	def top
		@posts = Post.all.score.order("DESC").paginate(page: params[:page], per_page: 10)
	end

	private

		def set_post
			@post = Post.find(params[:id])
		end

		def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post" if @post.nil?
    end

		def post_params
			params.require(:post).permit(:description, :image)
		end
		
end
