class PostsController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:new]
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @branch = params[:branch]
    @tags = Tag.where(branch: @branch)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      redirect_to post_path(@post) 
    else
      redirect_to root_path
    end
  end
  
  # Sidebar button - hobby
  def hobby
    posts_for_branch(params[:action])
  end

  # Sidebar button - study
  def study
    posts_for_branch(params[:action])
  end
  
  # Sidebar button - team
  def team
    posts_for_branch(params[:action])
  end
  
  private
  def posts_for_branch(branch)
    @tags = Tag.where(branch: branch)
    @posts = get_posts.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.js { render partial: 'posts/posts_pagination_page' }
    end
  end
  def get_posts
    PostsForBranchService.new({
      search: params[:search],
      tag: params[:tag],
      branch: params[:action]
    }).call
  end
  def post_params
    params.require(:post).permit(:content, :title, :tag_id)
                       .merge(user_id: current_user.id)
  end
end
