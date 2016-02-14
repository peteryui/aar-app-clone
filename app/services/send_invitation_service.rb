class SendInvitationService


  def initialize(user, email_address, team)
    @user = user
    @email_address = email_address
    @team = team
  end

  def perform!
    invitation = @user.sent_invitations.find_or_initialize_by(:team_id => @team.id, :email_address => @email_address,
      :status => "sent")

    if invitee = User.find_by_email(@email_address)
      invitation.invitee = invitee
    end

    invitation.save

    InvitationMailer.send_team_invitation(invitation, @team ).deliver
  end

end
