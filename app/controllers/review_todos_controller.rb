class ReviewTodosController < TeamsController


  before_action :find_review

  def new
    @todo = @review.todos.build
  end

  def show
    @todo = @review.todos.find(params[:id])

    drop_breadcrumb("Events", events_path)
    drop_breadcrumb(@event.name,event_path(@event))
    drop_breadcrumb("#{@review.subject}")


  end

  def edit
    @todo = @review.todos.find(params[:id])
  end

  def update
    @todo = @review.todos.find(params[:id])

    if @todo.update(todo_params)
      flash[:notice] = "成功建立 TODO"
      redirect_to event_review_path(@review.event_id, @review )
    else
      render :edit
    end
  end

  def destroy
    @todo = @review.todos.find(params[:id])
    @todo.destroy
    flash[:warning] = "成功刪除 TODO"
    redirect_to event_review_path(@review.event_id, @review )
  end


  def mark_open
    @todo = @review.todos.find(params[:id])
    @todo.open!
    flash[:warning] = "已重新打開此 todo"
    redirect_to :back
  end

  def mark_closed
    @todo = @review.todos.find(params[:id])
    @todo.close!
    flash[:notice] = "已把此 todo 設定「完成」"
    redirect_to :back
  end

  def mark_pending
    @todo = @review.todos.find(params[:id])
    @todo.pend!
    flash[:notice] = "已把此 todo 設定「擱置」"
    redirect_to :back
  end

  def create

    @todo = @review.todos.build(todo_params)
    @todo.user = current_user
    @todo.team = @team
    @todo.event = @review.event

    if @todo.save
      flash[:notice] = "成功建立 TODO"
      redirect_to event_review_path(@review.event_id, @review )
    else
      render :new
    end

  end


  protected

  def todo_params
    params.require(:todo).permit(:subject, :content)
  end

  def find_review

    @review = @team.reviews.find(params[:review_id])
    @event = @review.event
  end
end
