class ModulePagesController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_module_page, only: [:show, :edit, :update, :destroy]

  def index
    @module_pages = ModulePage.all
  end

  def new
    @module_page = ModulePage.new
    @module_page.module_composition_details.build
  end

  def create
    @module_page = ModulePage.new(module_page_params)
    if @module_page.save
      redirect_to module_pages_path, notice: "ModulePage was created successfully"
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @module_page.update(module_page_params)
      redirect_to module_pages_path, notice: "ModulePage was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @module_page.destroy
    redirect_to module_pages_path, notice: "ModulePage was deleted"
  end

  def clone_ae_page
    @module_page = ModulePage.find(params[:id])
    @module_entity_page = ModuleEntityPage.new
  end

  def save_cloned_ae
    @module_page = ModulePage.find(params[:module_page][:module_page_id])
    current_entities = @module_page.module_entity_page_details.pluck(:module_entity_page_id)
    if current_entities.include?(module_entity_page_detail_params[:module_entity_page_id].to_i)
      redirect_to clone_ae_page_module_pages_path(id: @module_page), alert: "Page already added"
    else
      @module_page.module_entity_page_details.build(module_entity_page_detail_params)
      @module_page.save
      redirect_to module_pages_path, notice: "Entity page added"
    end    
  end

  private

  def module_page_params
    params.require(:module_page).permit(:module_page_name, :navigation_header, :source_url, :page_avatar, :page_type, module_composition_details_attributes:[:id, :ui_element_id, :_destroy])
  end

  def module_entity_page_detail_params
    params.require(:module_page).permit(:module_page_id, :module_entity_page_id)
  end

  def set_module_page
    @module_page = ModulePage.find(params[:id])
  end
end
