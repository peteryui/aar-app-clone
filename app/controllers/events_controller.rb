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

  def index
    @events_grid = initialize_grid(Event.recent)
    drop_breadcrumb("Events", events_path)
  end
  
  def new
    @event = @team.events.build
    drop_breadcrumb("Events", events_path)
    drop_breadcrumb("New Event")
  end

  def show
    @event = Event.find(params[:id])
    # TODO: permission check

    @reviews_grid = initialize_grid(@event.reviews.recent)


    drop_breadcrumb("Events", events_path)
    drop_breadcrumb(@event.name,event_path(@event))
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

  def edit
    @event = Event.find(params[:id])
    # TODO :permission check

    drop_breadcrumb("Events", events_path)
    drop_breadcrumb("Edit Event")

  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end


  protected

  def event_params
    params.require(:event).permit(:name)
  end

end
