class Media < ActiveRecord::Base
  mount_uploader :file_name, MediaUploader
end

# == Schema Information
#
# Table name: media
#
#  id         :integer          not null, primary key
#  file_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
