class VideosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:thumb_upload]

  def index
    @videos = current_user.videos.order(id: :desc)
  end

  def show
    @video = current_user.videos.find(params[:id])
  end

  def thumb
    @video = current_user.videos.find(params[:id])
  end

  def thumb_upload
    # Extract the base64 encoded image
    img = params["thumbnail"]['data:image/png;base64,'.length..-1]

    # Decode the image data
    decoded_image = Base64.decode64(img)

    # Create a Tempfile
    file = Tempfile.new([Time.now.to_i.to_s, '.png'])
    file.binmode
    file.write(decoded_image)
    file.rewind

    # Send the file data to the YouTube data API
    begin
      video = current_user.videos.find(params[:id])
      y = Youtube.new(current_user.youtube_sessions.last)
      y.set_thumbnail(video, file)
    ensure
      # Close the Tempfile
      file.close
      file.unlink
    end
  end

  def sync
    @video = current_user.videos.find(params[:id])
    y = Youtube.new(current_user.youtube_sessions.last)
    y.update_video(@video)
    redirect_back(fallback_location: root_path)
  end

  def edit
    @video = current_user.videos.find(params[:id])
    @description_templates = current_user.description_templates.all
    @presenters = current_user.presenters.all
    @categories = current_user.categories.all
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
      :category_id,
      :raw_tags,
      :chapter_markers,
      :summary,
      :description_template_id,
      presenter_ids: []
    )
  end
end
