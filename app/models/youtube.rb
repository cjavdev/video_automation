require 'google/apis/youtube_v3'

class Youtube
  def initialize(session)
    @session = session
  end

  def refresh_token
    # returns the refresh token data
    auth_client.refresh!
  end

  # def upload_video(file, title, description)
  #   status = Google::Apis::YoutubeV3::VideoStatus.new(
  #     privacy_status: 'unlisted',
  #   )
  #   snippet = Google::Apis::YoutubeV3::VideoSnippet.new(
  #     title: title,
  #     description: description,
  #   )
  #   video_object = Google::Apis::YoutubeV3::Video.new(
  #     status: status,
  #     snippet: snippet,
  #   )
  #   service.insert_video(
  #     'id,snippet,status',
  #     video_object,
  #     notify_subscribers: false,
  #     upload_source: file,
  #     content_type: 'video/webm',
  #     options: {
  #       authorization: auth_client
  #     }
  #   )
  # end
  #
  # def set_thumbnail(video, file)
  #   service.set_thumbnail(
  #     video.youtube_id,
  #     upload_source: file,
  #     content_type: 'image/png',
  #     options: {
  #       authorization: auth_client
  #     }
  #   )
  # end

  def fetch_channel
    channels = service.list_channels(
      'id',
      mine: true,
      options: {
        authorization: auth_client
      }
    )
    channels.items.first
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

  def fetch_video(video_id)
    video_list = service.list_videos(
      'snippet',
      id: [video_id],
      options: {
        authorization: auth_client
      }
    )
    if video_list.items.empty?
      raise "Video #{video_id} not found"
    end
    video_list.items.first
  end

  # def update_video(video)
  #   external_video = Google::Apis::YoutubeV3::Video.new(
  #     id: video.youtube_id,
  #     snippet: Google::Apis::YoutubeV3::VideoSnippet.new(
  #       title: video.title,
  #       tags: video.tags,
  #       category_id: 27, # Education
  #       description: video.description,
  #     )
  #   )
  #   service.update_video(
  #     'snippet',
  #     external_video,
  #     options: {
  #       authorization: auth_client
  #     }
  #   )
  # end

  def service
    @service ||= Google::Apis::YoutubeV3::YouTubeService.new
  end

  def auth_client
    @auth_client ||= Signet::OAuth2::Client.new(@session.credentials)
    @auth_client.update!(
      client_id: Rails.application.credentials.dig(:youtube, :client_id),
      client_secret: Rails.application.credentials.dig(:youtube, :client_secret),
      additional_parameters: {
        'access_type' => 'offline',
      }
    )
    @auth_client
  end
end
