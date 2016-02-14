class Review < ActiveRecord::Base
end

# == Schema Information
#
# Table name: reviews
#
#  id               :integer          not null, primary key
#  subject          :string
#  should_happen    :string
#  actual_happen    :string
#  improvement_plan :string
#  user_id          :integer
#  event_id         :integer
#  team_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
