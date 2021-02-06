# == Schema Information
#
# Table name: video_resources
#
#  id         :bigint           not null, primary key
#  url        :string           not null
#  title      :string           not null
#  video_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VideoResource < ApplicationRecord
  belongs_to :video
end
