class TeamBaseController < TeamsController
  def index
    @events_grid = initialize_grid(@team.events.recent)
  end
end
