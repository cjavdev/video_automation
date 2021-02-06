class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
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
      :tags,
      :chapter_markers,
      :description_template_id,
      presenter_ids: []
    )
  end
end
