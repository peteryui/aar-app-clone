class SessionsController < Devise::SessionsController

  def new
    @team = Team.find_by_domain(request.host.split('.').first)

    if @team.blank?
      flash["warning"] = "We don't have this domain"
      redirect_to signin_url( :subdomain => false)
      return
    end

    super
  end
  
end