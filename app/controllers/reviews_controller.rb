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
      redirect_to event_path(@event)
    else
      render :new 
    end

  end



  protected

  def review_params
    params.require(:review).permit(:subject, :should_happen, :actual_happen, :improvement_plan)
  end

  def find_event
    @event = @team.events.find(params[:event_id])
  end
end
