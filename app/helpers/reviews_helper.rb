# == Schema Information
#
# Table name: reviews
#
#  id               :integer          not null, primary key
#  subject          :string
#  should_happen    :text
#  actual_happen    :text
#  improvement_plan :text
#  user_id          :integer
#  event_id         :integer
#  team_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  comments_count   :integer          default(0)
#  todos_count      :integer          default(0)
#

module ReviewsHelper

  def render_review_subject(review)
    link_to(review.subject, event_review_path(review.event_id, review))
  end
end
