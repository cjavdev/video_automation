class VideoRecordingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    # Make an API call to the YouTube API.
    y = Youtube.new(current_user.youtube_sessions.last)
    video = y.upload_video(
      params[:video_recordings][:file].tempfile,
      "Standup from 2021-03",
      "My 5 min standup from March",
    )
    render json: video
  end
end
