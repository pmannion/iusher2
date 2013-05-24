module CommentsHelper
  def gravatar_for(comment,image_options={size: 20}, html_options={})
    link_to(image_tag(comment.pic.url,image_options), profile_path(user.profile_name),html_options)
  end
end
