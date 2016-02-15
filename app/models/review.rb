class Review < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :team

  acts_as_commentable


  validates :subject, presence: true


  scope :recent , -> { order("id DESC")}

  after_create :set_team


  def set_team
    self.team = self.event.team
    self.save
  end
end

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
#
