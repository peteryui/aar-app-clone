module ReviewCommentsHelper

  def render_review_comment_content(log)
    log.comment.to_markdown
  end

  def render_user_name(user)
    user.name
  end

end
