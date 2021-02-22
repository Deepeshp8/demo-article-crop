class PostsController < ApplicationController
	before_action :authenticate_user! ,except: [:index, :show, :homepage]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		debugger
		@post = Post.new(post_params)
		
		@post.featured_image = params[:featured_image]
		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		
		@post = Post.find(params[:id])
		
		if(@post.update(post_params))
			if(!params[:post][:featured_image].nil?)
				@post.featured_image = params[:featured_image]
				@post.save
				redirect_to @post
			else
				redirect_to @post
			end	
		else
			render 'edit'
		end	
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title,:description,:category_id)

	end
end
