class RegistrationsController < Devise::RegistrationsController

  def sign_up_with_invitation
    session[:previous_url] = nil # clear session for infinite loop

    @invitation_code = params[:id]

    @invitation = Invitation.find_by_code(@invitation_code)

    if !@invitation.present?
      flash[:danger] = "The invitation code is invalid."
      return redirect_to root_path
    end

    if !@invitation.sent?
      flash[:danger] = "The invitation has been used."
      return redirect_to root_path
    end

    if current_user
      if @invitation.available_for_guest?
        @invitation.invitee = current_user
        @invitation.save
      end

      return redirect_to account_organizations_path
    else
      if @invitation.available_for_guest?
        build_resource({})
  
      else
        session[:previous_url] = request.original_url
        redirect_to new_user_session_path
      end
    end
  end

  def new
    build_resource({})
    t = self.resource.teams.build
    respond_with self.resource
  end

  def create
    super
  end


  private



  def sign_up_params
    params.require(:user).permit(:name, :email, :teams_attributes => [ :name, :domain ])
  end

  def account_update_params
    params.require(:user)
  end
end
