class PresentersController < ApplicationController
  def index
    @presenters = current_user.presenters.all
  end

  def new
    @presenter = current_user.presenters.new
  end

  def create
    @presenter = current_user.presenters.new(presenter_params)
    if @presenter.save
      redirect_to presenters_path
    else
      flash.now[:errors] = @presenter.errors.full_messages
      render :new
    end
  end

  def edit
    @presenter = current_user.presenters.find(params[:id])
  end

  def update
    @presenter = current_user.presenters.find(params[:id])
    if @presenter.update(presenter_params)
      redirect_to presenters_path
    else
      flash.now[:errors] = @presenter.errors.full_messages
      render :edit
    end
  end

  private

  def presenter_params
    params.require(:presenter).permit(
      :name,
      :twitter_handle,
      :linked_in,
      :role
    )
  end
end
