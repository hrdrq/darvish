class BlogsController < ApplicationController
  before_action :set_blogs, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [ :new, :create, :edit, :update, :destroy]
  before_filter :only_allow_admin, :only => [ :new, :create, :edit, :update, :destroy]
  def index
    if params.has_key?(:year)
  		@blogs = Blog.where(:dt.lte => "#{params[:year]}-12-31", :dt.gte => "#{params[:year]}-1-1").desc(:id).page(params[:page]).per(10)
  	else
  		@blogs = Blog.all.desc(:id).page(params[:page]).per(10)
  	end

  end

  def show
    @comments = @blog.comments.desc(:created_at)
    @new_comment = @blog.comments.build()

  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render action: 'edit' 
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  def feed
    @blogs = Blog.all.desc(:id).limit(20)
    respond_to do |format|
      format.atom
    end
  end

  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if @blog.valid?
      @blog.save
      flash.now[:notice] = "部落格增加完成"
      redirect_to new_blog_path
    else
      render :new
    end
  end

  private

  def set_blogs
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:id,:dt,:url, :title, :content)
  end

  def comment_params
    params.require(:comment).permit(:name, :content)
  end

  def only_allow_admin
    redirect_to root_path unless current_user.has_role? :admin
  end
end
