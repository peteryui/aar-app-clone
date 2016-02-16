module ReviewTodosHelper

  def render_mark_todo_pending_btn(todo)
    link_to("暫時擱置", mark_pending_review_todo_path(todo.review_id, todo, :from => controller.controller_name ), :method => :post )
  end

  def render_mark_todo_open_btn(todo )
    link_to("重新打開", mark_open_review_todo_path(todo.review_id, todo, :from => controller.controller_name ), :method => :post )
  end

  def render_mark_todo_closed_btn(todo)
    link_to("設為已完成", mark_closed_review_todo_path(todo.review_id, todo, :from => controller.controller_name ), :method => :post )
  end


  def render_todo_subject(todo)
    link_to(todo.subject, review_todo_path(todo.review_id, todo ))
  end

  def render_todo_status(todo)
    case todo.status
    when "open"
      content_tag(:span, "Open", :class => "label label-success")
    when "pending"
      content_tag(:span, "Pending", :class => "label label-default")
    when "closed"
      content_tag(:span, "Closed", :class => "label label-default")
    end
  end


  def render_todo_content_box_by_status(todo)

    case todo.status
    when "open"
      render :partial => "review_todos/status/open", :locals => { :todo => todo }
    when "pending"
      render :partial => "review_todos/status/pending", :locals => { :todo => todo }
    when "closed"
      render :partial => "review_todos/status/closed", :locals => { :todo => todo }
    end

  end
end
