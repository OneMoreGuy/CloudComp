module PostsHelper
  def create_new_post_partial_path
    if user_signed_in?
      '../views/posts/branch/create_new_post/signed_in'
    else
      '../views/posts/branch/create_new_post/not_signed_in'
    end
  end
  def all_tags_button_partial_path
    if params[:tag].blank?
      '../views/posts/branch/tags/all_selected'
    else
      '../views/posts/branch/tags/all_not_selected'
    end
  end
  # Logic for when there are no posts to display.
  def no_posts_partial_path
    @posts.empty? ? '../views/posts/branch/no_posts' : '../views/shared/empty_partial'
  end
  def post_format_partial_path
    current_page?(root_path) ? '../views/posts/post/home_page' : '../views/posts/post/branch_page'
  end
    def tag_field_partial_path
      if params[:tag].present?
        '../views/posts/branch/search_form/tag_field'
      else
        '../views/shared/empty_partial'
    end
  end
end
