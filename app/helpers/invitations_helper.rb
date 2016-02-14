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

module InvitationsHelper

  def render_invitation_id(invitation)
    invitation.id
  end

  def render_invitation_email_address(invitation)
    invitation.email_address
  end


  def render_invitation_iniviter_name(invitation)
    invitation.inviter.name
  end

  def render_invitation_created_at(invitation)
    invitation.created_at.to_s(:long)
  end

  def render_invitation_status(invitation)
    invitation.status
  end

  def render_invitation_send_btn
    link_to "Send invitaion", new_invitation_path, :remote => true, :class => "btn btn-default pull-right"
  end

  def render_invitation_cancel_btn(invitation)
    link_to "Cancel", cancel_invitation_path(invitation), :method => :delete, :class => "btn btn-default"
  end

  def render_invitation_resend_btn(invitation)
    link_to "Resend", resend_invitation_path(invitation), :method => :post, :class => "btn btn-default"
  end

end
