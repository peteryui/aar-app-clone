class InvitationMailer < ApplicationMailer
  def send_team_invitation(invitation, team)

    @invitation = invitation
    @inviter = @invitation.inviter
    @email_address = @invitation.email_address
    @team = @invitation.team

    mail(:to => @email_address, :subject => "#{@inviter.name} asked you to join the #{@team.name}")

  end
end
