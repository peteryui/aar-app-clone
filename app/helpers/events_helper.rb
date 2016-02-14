# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module EventsHelper

  def render_event_name(event)
    link_to(event.name,event_path(event))
  end
end
