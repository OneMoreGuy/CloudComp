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
    respond_to do |format|
      format.html
      format.js { render partial: 'posts/posts_pagination_page' }
    end
  end
  def get_posts
    branch = params[:action]
    search = params[:search]
    tag = params[:tag]

    if tag.blank? && search.blank?
      posts = Post.by_branch(branch).all
    elsif tag.blank? && search.present?
      posts = Post.by_branch(branch).search(search)
    elsif tag.present? && search.blank?
      posts = Post.by_tag(branch, tag)
    elsif tag.present? && search.present?
      posts = Post.by_tag(branch, tag).search(search)
    else
  end
  end
end
