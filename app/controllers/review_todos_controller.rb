class ReviewTodosController < TeamsController


  before_action :find_review

  def new
    @todo = @review.todos.build
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
      render "reviews/show"
    end

  end


  protected

  def todo_params
    params.require(:todo).permit(:subject, :content)
  end

  def find_review
    @review = @team.reviews.find(params[:review_id])
  end
end
