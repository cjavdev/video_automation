# == Schema Information
#
# Table name: youtube_sessions
#
#  id            :bigint           not null, primary key
#  session_token :string           not null
#  credentials   :json
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
class YoutubeSession < ApplicationRecord
  belongs_to :user

  before_validation(on: :create) do
    self.session_token ||= SecureRandom.hex
  end
end
