namespace :youtube do
  task fetch_videos: :environment do
    y = Youtube.new(YoutubeSession.last)
    y.fetch_videos do |external_video|
      snippet = external_video.snippet
      id = external_video.id

      video = Video.find_by(youtube_id: id)
      if video.nil?
        Video.create!(
          youtube_id: id,
          title: snippet.title,
          tags: snippet.tags,
          summary: snippet.description,
          description_template: DescriptionTemplate.last
        )
      end
    end
  end
end
