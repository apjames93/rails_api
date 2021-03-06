class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]


# GET /posts/
  def index
    @posts = Post.all

    render json: @posts
  end


  # GET /posts/1
  def show
    render json: @post, root: false
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end


  # PUT /posts/1
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy

    head :no_content
  end



private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :text)
  end


end
