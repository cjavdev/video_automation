class VideosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:thumb_upload]

  def index
    @videos = Video.order(id: :desc)
  end

  def show
    @video = Video.find(params[:id])
  end

  def thumb
    @video = Video.find(params[:id])
  end

  def sync
    @video = Video.find(params[:id])
    y = Youtube.new(YoutubeSession.last)
    y.update_video(@video)
    redirect_back(fallback_location: root_path)
  end

  def edit
    @video = Video.find(params[:id])
    @description_templates = DescriptionTemplate.all
    @presenters = Presenter.all
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to @video
    else
      flash.now[:errors] = @video.errors.full_messages
      render :edit
    end
  end

  private

  def video_params
    params[:video][:presenter_ids] ||= []
    params.require(:video).permit(
      :title,
      :subtitle,
      :raw_tags,
      :chapter_markers,
      :summary,
      :description_template_id,
      presenter_ids: []
    )
  end
end
