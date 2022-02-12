class PostsForBranchService
  def initialize(params)
    @search = params[:search]
    @tag = params[:tag]
    @branch = params[:branch]
  end

  # get posts depending on the request
  def call
    if @tag.blank? && @search.blank?
      posts = Post.by_branch(@branch).all
    elsif @tag.blank? && @search.present?
      posts = Post.by_branch(@branch).search(@search)
    elsif @tag.present? && @search.blank?
      posts = Post.by_tag(@branch, @tag)
    elsif @tag.present? && @search.present?
      posts = Post.by_tag(@branch, @tag).search(@search)
    else
    end
  end

end
