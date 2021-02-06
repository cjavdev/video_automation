class DescriptionTemplatesController < ApplicationController
  def index
    @templates = DescriptionTemplate.all
  end

  def new
    @template = DescriptionTemplate.new
  end

  def create
    @template = DescriptionTemplate.new(template_params)
    if @template.save
      redirect_to description_templates_path
    else
      flash.now[:errors] = @template.errors.full_messages
      render :new
    end
  end

  def edit
    @template = DescriptionTemplate.find(params[:id])
  end

  def update
    @tempalte = DescriptionTemplate.find(params[:id])

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
