module TodoCommentsHelper
  def render_todo_comment_content(comment)
    comment.comment.to_markdown
  end
end
