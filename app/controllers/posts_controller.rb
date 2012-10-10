class PostsController < ApplicationController
  caches_page :index, :show
  cache_sweeper :post_sweeper

  before_filter :authorize, :except => [:index, :show]
  before_filter(only: [:index, :show]) { @page_caching = true }

  def index
    if current_user
      @posts = Post.order("published_at DESC")
    else 
      @posts = Post.published
    end
  end

  def show
    if current_user
      @post = Post.find(params[:id])
    else 
      @post = Post.published.find(params[:id])
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_url
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_url
    else
      render :edit
    end
  end

  def destroy

  end
end
