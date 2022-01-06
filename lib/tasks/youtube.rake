namespace :youtube do
  task fetch_videos: :environment do
    User.all.each do |user|
      category = user.categories.first
      template = user.description_templates.last

      # If the user has never authenticated with YouTube, then skip.
      next if user.youtube_sessions.empty?

      y = Youtube.new(user.youtube_sessions.last)
      y.fetch_videos do |external_video|
        snippet = external_video.snippet
        id = external_video.id

        video = Video.find_by(youtube_id: id)
        if video.nil?
          user.videos.create!(
            category: category,
            youtube_id: id,
            title: snippet.title,
            tags: snippet.tags,
            summary: snippet.description,
            description_template: template,
          )
        else
          video.update(
            title: snippet.title,
            tags: snippet.tags,
            summary: snippet.description,
          )
        end
      end
    end
  end
end
