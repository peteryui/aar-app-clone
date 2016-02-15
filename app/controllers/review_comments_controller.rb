class ReviewCommentsController < TeamsController

  before_action :find_review

  def create

    @comment = @review.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "成功留言"
      redirect_to event_review_path(@review.event_id, @review )
    else
      render "reviews/show"
    end

  end

  def edit
    @comment = @review.comments.find(params[:id])
  end

  def update
    @comment = @review.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to event_review_path(@review.event_id, @review)
    else
      render :edit
    end

  end

  def destroy
    @comment = @review.comments.find(params[:id])
    @comment.destroy

    redirect_to event_review_path(@review.event_id, @review)

  end

  protected

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_review
    @review = @team.reviews.find(params[:review_id])
  end

end
