# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventsController < TeamsController

  def new
    @event = @team.events.build
  end

  def create
    @event = @team.events.build(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def index
    @events_grid = initialize_grid(Event.recent)
  end
  protected

  def event_params
    params.require(:event).permit(:name)
  end

end
