require 'google/apis/youtube_v3'

class Youtube
  def initialize(session)
    @session = session
  end

  def set_thumbnail(video, file)
    service.set_thumbnail(
      video.youtube_id,
      upload_source: file,
      content_type: 'image/png',
      options: {
        authorization: auth_client
      }
    )
  end

  def fetch_videos(&blk)
    page_token = nil
    loop do
      sr_page = service.list_searches(
        'snippet',
        for_mine: true,
        type: 'video',
        page_token: page_token,
        max_results: 50,
        options: {
          authorization: auth_client
        }
      )
      video_ids = sr_page.items.map do |item|
        item.id.video_id
      end

      videos_page = service.list_videos(
        'snippet',
        id: video_ids,
        options: {
          authorization: auth_client,
        }
      )

      videos_page.items.each do |item|
        blk.call(item)
      end

      page_token = sr_page.next_page_token
      break if page_token.nil?
    end
  end

  def update_video(video)
    external_video = Google::Apis::YoutubeV3::Video.new(
      id: video.youtube_id,
      snippet: Google::Apis::YoutubeV3::VideoSnippet.new(
        title: video.title,
        tags: video.tags,
        category_id: 27, # Education
        description: video.description,
      )
    )
    service.update_video(
      'snippet',
      external_video,
      options: {
        authorization: auth_client
      }
    )
  end

  def service
    @service ||= Google::Apis::YoutubeV3::YouTubeService.new
  end

  def auth_client
    @auth_client ||= Signet::OAuth2::Client.new(@session.credentials)
  end
end