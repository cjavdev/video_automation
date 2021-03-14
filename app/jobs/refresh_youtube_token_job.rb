class RefreshYoutubeTokenJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    session = user.youtube_sessions.last

    y = Youtube.new(session)
    new_token = y.refresh_token

    # merge with existing creds and save!
    creds = session.credentials
    creds["access_token"] = new_token["access_token"]
    creds["expires_at"] = Time.now.to_i + new_token["expires_in"]
    session.credentials = creds
    session.save!
  end
end
