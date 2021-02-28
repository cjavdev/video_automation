class ApplicationController < ActionController::Base
  helper_method :video_embed
  before_action :authenticate_user!

  def video_embed(video)
    <<~HTML.html_safe
      <iframe
        width="560"
        height="315"
        src="https://www.youtube.com/embed/#{video.youtube_id}"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
    HTML
  end
end
