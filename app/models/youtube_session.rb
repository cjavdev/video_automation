class YoutubeSession < ApplicationRecord
  before_validation(on: :create) do
    self.session_token ||= SecureRandom.hex
  end
end
