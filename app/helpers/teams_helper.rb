# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  domain     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module TeamsHelper
  def render_team_page_title_tag
    # fallback to site_name if @page_title has never been set
    title_tag(page_title || @team.name)
  end


end
