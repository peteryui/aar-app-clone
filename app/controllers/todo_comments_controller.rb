class TodoCommentsController < TeamsController

    before_action :find_todo

    def create

      @comment = @todo.comments.build(comment_params)
      @comment.user = current_user
      @comment.team = @team

      if @comment.save
        flash[:notice] = "成功留言"
        redirect_to review_todo_path(@todo.review_id, @todo , :anchor => view_context.dom_id(@comment)  )
      else
        render "todos/show"
      end

    end

    def edit
      @comment = @todo.comments.find(params[:id])
    end

    def update
      @comment = @todo.comments.find(params[:id])

      if @comment.update(comment_params)
        redirect_to review_todo_path(@todo.review_id, @todo , :anchor => view_context.dom_id(@comment)  )
      else
        render :edit
      end

    end

    def destroy
      @comment = @todo.comments.find(params[:id])
      @review = @todo.review
      @comment.destroy

      redirect_to :back

    end

    protected

    def comment_params
      params.require(:comment).permit(:comment)
    end

    def find_todo
      @todo = @team.todos.find(params[:todo_id])
    end

end
