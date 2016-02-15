# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  team_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  todos_count :integer          default(0)
#

require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
