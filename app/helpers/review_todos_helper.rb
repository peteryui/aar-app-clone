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


  def render_todo_status(todo)
    case todo.status
    when "open"
      content_tag(:span, "Open", :class => "label label-success")
    when "pending"
      content_tag(:span, "Pending", :class => "label label-default")
    when "closed"
      content_tag(:span, "Closed", :class => "label label-warning")
    end
  end
end
