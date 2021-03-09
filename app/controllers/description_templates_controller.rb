class DescriptionTemplatesController < ApplicationController
  def index
    @templates = current_user.description_templates.all
  end

  def new
    @template = current_user.description_templates.new
  end

  def create
    @template = current_user.description_templates.new(template_params)
    if @template.save
      redirect_to description_templates_path
    else
      flash.now[:errors] = @template.errors.full_messages
      render :new
    end
  end

  def edit
    @template = current_user.description_templates.find(params[:id])
  end

  def update
    @tempalte = current_user.description_templates.find(params[:id])

    if @tempalte.update(template_params)
      redirect_to description_templates_path
    else
      flash.now[:errors] = @template.errors.full_messages
      render :update
    end
  end

  private

  def template_params
    params.require(:template).permit(
      :name,
      :template
    )
  end
end
