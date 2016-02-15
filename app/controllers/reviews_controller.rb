# == Schema Information
#
# Table name: reviews
#
#  id               :integer          not null, primary key
#  subject          :string
#  should_happen    :text
#  actual_happen    :text
#  improvement_plan :text
#  user_id          :integer
#  event_id         :integer
#  team_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  comments_count   :integer          default(0)
#

class ReviewsController < TeamsController

  before_action :find_event

  def new
    @review = @event.reviews.build

    drop_breadcrumb("Events", events_path)
    drop_breadcrumb(@event.name,event_path(@event))
    drop_breadcrumb("New Review")
  end

  def create
    @review = @event.reviews.build(review_params)
    @review.user = current_user

    if @review.save

      flash[:notice] = "Review ##{@review.id} 已建立"
      if params["commit"] != "Submit"
        redirect_to new_event_review_path(@event)
      else
        redirect_to event_review_path(@event,@review)
      end

    else
      render :new
    end

  end

  def edit
    @review = @event.reviews.find(params[:id])
    # TODO : Add permission check


    drop_breadcrumb("Events", events_path)
    drop_breadcrumb(@event.name,event_path(@event))
    drop_breadcrumb("Edit Review")
  end

  def update
    @review = @event.reviews.find(params[:id])

    if @review.update(review_params)

      redirect_to event_review_path(@review.event_id, @review)

    else
      render :edit
    end
  end

  def show
    @review = @event.reviews.find(params[:id])


    drop_breadcrumb("Events", events_path)
    drop_breadcrumb(@event.name,event_path(@event))
    drop_breadcrumb("#{@review.subject}")

  end

  def destroy
    @review = @event.reviews.find(params[:id])

    @review.destroy

    redirect_to event_path(@event)
  end


  protected

  def review_params
    params.require(:review).permit(:subject, :should_happen, :actual_happen, :improvement_plan)
  end

  def find_event
    @event = @team.events.find(params[:event_id])
  end
end
