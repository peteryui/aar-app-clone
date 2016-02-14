class InvitationsController < TeamsController

  def index
    drop_breadcrumb("Invitations", invitations_path)
  end

  def new
  end


end
