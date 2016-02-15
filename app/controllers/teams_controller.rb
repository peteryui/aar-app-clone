# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string
#  domain      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  todos_count :integer          default(0)
#

class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_this_team
  before_action :set_breadcrumbs


  layout "teams"

  def set_breadcrumbs
    @breadcrumbs = [view_context.link_to(@team.name, "/")]
  end

  def drop_breadcrumb(title=nil, url=nil)
    title ||= @page_title

    if title && url
      @breadcrumbs.push("<a href='#{url}'>#{title}</a>".html_safe)
    elsif title
      @breadcrumbs.push("#{title}".html_safe)
    end
  end

    helper_method :set_page_title

    # will also append current page number and the site name
    def set_page_title(title)
      if params[:page]
        @page_title = SeoHelper.format_current_page(title, params[:page])
      else
        @page_title = title
      end


      @page_title = SeoHelper.format_site_name( @page_title + " | #{@team.name} ", SeoHelper.configuration.site_name)
    end



  protected


  def find_this_team

    @team = current_user.teams.find_by_domain(request.host.split('.').first)
    # make sure with domain
    # TODO: devise also need to check permission
    # TODO: check redirect path

  end

end
