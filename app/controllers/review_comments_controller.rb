class ReviewCommentsController < TeamsController

  before_action :find_review, :only => [:create]

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

  protected

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def find_review
    @review = @team.reviews.find(params[:review_id])
  end

end
