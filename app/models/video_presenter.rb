# == Schema Information
#
# Table name: video_presenters
#
#  id           :bigint           not null, primary key
#  video_id     :bigint           not null
#  presenter_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class VideoPresenter < ApplicationRecord
  belongs_to :video
  belongs_to :presenter
end
