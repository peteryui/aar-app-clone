# == Schema Information
#
# Table name: invitations
#
#  id            :integer          not null, primary key
#  code          :string
#  email_address :string
#  team_id       :integer
#  inviter_id    :integer
#  invitee_id    :integer
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class InvitationsController < TeamsController

  def index
    drop_breadcrumb("Invitations", invitations_path)
      @sent_invitations = @team.invitations.recent
  end

  def new

    @invitation = @team.invitations.build

    drop_breadcrumb("Invitations", invitations_path)
    drop_breadcrumb("New Invitation", invitations_path)
  end

  def create
    # TODO : permission check


    @invitation = @team.invitations.build(invitation_params)
    invitee = User.find_by_email(@invitation.email_address)

    if invitee && invitee.teams.include?(@team)
      flash[:danger] = "The user is already in this team"
      render :new
      return
    end

    if @invitation.valid?
      SendInvitationService.new(current_user, @invitation.email_address, @team).perform!
      redirect_to invitations_path
    else
      flash[:danger] = @invitation.errors.full_messages.first
      redirect_to invitations_path
    end

  end

  def resend
    #TODO only admin can resend invitation
    invitation = @team.invitations.find(params[:id])

    SendInvitationService.new(invitation.inviter, invitation.email_address, @team).perform!

    redirect_to invitations_path
  end



    def cancel
      #TODO only admin can cancel invitation

      invitation = @team.invitations.find(params[:id])

      invitation.cancel!

      redirect_to invitations_path
    end

  private

  def invitation_params
    params.require(:invitation).permit([:email_address])
  end

end
