class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
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
  end
  def get_posts
    Post.limit(30)
  end
end
