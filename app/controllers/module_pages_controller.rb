class ModulePagesController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_module_page, only: [:show, :edit, :update, :destroy]

  def index
    # CSMK-01
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

  def edit
  end

  def show
  end

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
    
    # byebug

    # @module_page = ModulePage.find(params[:module_entity_page][:module_page_id])
    # @module_entity_page = ModuleEntityPage.find_by_module_entity_page_name(params[:module_entity_page][:module_entity_page_name])
    # check_clone = ModuleEntityPage.where(module_page_id: @module_page&.id, module_entity_page_name: @module_entity_page&.module_entity_page_name).first
    # if check_clone.blank?
    #   cloned_entity_page = @module_page.module_entity_pages.new(
    #     module_page_id: @module_page&.id,
    #     module_entity_page_name: @module_entity_page&.module_entity_page_name,
    #     source_url: @module_entity_page&.source_url,
    #     page_type: @module_entity_page&.page_type,
    #     page_avatar: @module_entity_page&.page_avatar
    #   )
    #   cloned_entity_page.save
    #   if @module_entity_page.module_composition_details.present?
    #     @module_entity_page.module_composition_details.each do |composition_detail|
    #       cloned_entity_page.module_composition_details.find_or_create_by({
    #         module_page_id: @module_page&.id, module_entity_page_id: cloned_entity_page&.id, ui_element_id: composition_detail&.ui_element_id
    #       })
    #     end
    #   end
    # end
    # if @module_entity_page.module_composition_details.present? && check_clone.present? && check_clone.module_composition_details.blank?
    #   cloned_entity_page = check_clone
    #   @module_entity_page.module_composition_details.each do |composition_detail|
    #     cloned_entity_page.module_composition_details.find_or_create_by({
    #       module_page_id: @module_page&.id, module_entity_page_id: cloned_entity_page&.id, ui_element_id: composition_detail&.ui_element_id
    #     })
    #   end
    # end
    
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
