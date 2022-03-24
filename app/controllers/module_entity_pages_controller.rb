class ModuleEntityPagesController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_module_entity_page, only: [:show, :edit, :update, :destroy]

  def index
    @module_entity_pages = ModuleEntityPage.all
  end

  def new
    @module_entity_page = ModuleEntityPage.new
    @module_entity_page.module_composition_details.build
  end

  def create
    @module_entity_page = ModuleEntityPage.new(module_entity_page_params)
    if @module_entity_page.save
      redirect_to module_entity_pages_path, notice: "ModuleEntityPage was scheduled successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @module_entity_page.update(module_entity_page_params)
      redirect_to module_entity_pages_path, notice: "ModuleEntityPage was updated successfully"
    else
      render :edit
    end    
  end

  def destroy
    @module_entity_page.destroy
    redirect_to module_entity_pages_path, notice: "Entity Page was deleted"
  end

  private

  def module_entity_page_params
    params.require(:module_entity_page).permit(:module_entity_page_name, :source_url, :page_avatar, :page_type, module_composition_details_attributes:[:id, :ui_element_id, :_destroy])
  end

  def set_module_entity_page
    @module_entity_page = ModuleEntityPage.find(params[:id])
  end
end
