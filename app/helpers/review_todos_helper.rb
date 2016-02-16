module ReviewTodosHelper

  def render_mark_todo_pending_btn(todo)
    link_to("暫時擱置", mark_pending_review_todo_path(todo.review_id, todo), :method => :post )
  end

  def render_mark_todo_open_btn(todo)
    link_to("重新打開", mark_open_review_todo_path(todo.review_id, todo), :method => :post )
  end

  def render_mark_todo_closed_btn(todo)
    link_to("設為已完成", mark_closed_review_todo_path(todo.review_id, todo), :method => :post )
  end


end
