class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [ :index, :show, :edit, :update, :destroy]
  before_filter :only_allow_admin, :only => [ :index, :show, :edit, :update, :destroy]
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    # @comment = @blog.comments.build(comment_params)
    @comment = Comment.new(comment_params)
    # Rails.logger.debug "eeeeee"
    # Rails.logger.debug @comment.blog_id
    # Rails.logger.debug "gggggg"
    if @comment.save
      render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
    else
      render :js => "alert('error saving comment');"
    end
  end

  def update
      if @comment.update(comment_params)
        redirect_to blog_path(@comment.blog_id)
      else
        render action: 'edit' 
      end
  end

  def destroy
    if @comment.destroy
      render :json => @comment, :status => :ok
    else
      render :js => "alert('error deleting comment');"
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:name, :content, :blog_id)
    end

    def only_allow_admin
      redirect_to root_path unless current_user.has_role? :admin
    end
end
