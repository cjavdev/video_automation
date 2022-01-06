# == Schema Information
#
# Table name: videos
#
#  id                      :bigint           not null, primary key
#  youtube_id              :string           not null
#  title                   :string           not null
#  tags                    :string           default([]), is an Array
#  chapter_markers         :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  description_template_id :bigint           not null
#  summary                 :text
#  category_id             :bigint           not null
#  user_id                 :bigint           not null
#
class Video < ApplicationRecord
  belongs_to :description_template
  belongs_to :category
  belongs_to :user
  has_many :video_presenters
  has_many :presenters, through: :video_presenters
  has_many :video_resources

  def raw_tags=(raw_tags)
    self.tags = raw_tags.split(',').map(&:strip)
  end

  def url
    "https://www.youtube.com/watch?v=#{youtube_id}"
  end

  def fetch!
    youtube = Youtube.new(user.youtube_sessions.last)
    video = youtube.fetch_video(youtube_id)
    snippet = video.snippet
    update(
      title: snippet.title,
      description: snippet.description,
      tags: snippet.tags,
    )
  end

  # def description
  #   erb_template = ERB.new(
  #     description_template.template,
  #     safe_eval=nil,
  #     trim_mode=nil,
  #     outvar='_erbout'
  #   )
  #   erb_template.result(binding)
  # end

  def thumb_svg
    img_template = File.read(File.join(Rails.root, "app", "views", "videos", "thumb-base.svg.erb"))
    erb_template = ERB.new(
      img_template,
      safe_eval=nil,
      trim_mode=nil,
      outvar='_erbout'
    )
    erb_template.result(binding)
  end
end
