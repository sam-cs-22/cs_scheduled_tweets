class ModuleEntityPagesController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_module_entity_page, only: [:show, :edit, :update, :destroy]

  def index
    # CSMK-01
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
    # byebug
    # module_page_ids = params[:module_entity_page][:module_page_ids].reject!(&:blank?)
    # module_page_ids.each do |mp|
    #   module_page = ModulePage.find(mp.to_i)
    #   entity_page = module_page.module_entity_pages.new(module_entity_page_params)
    #   entity_page.module_page_id = module_page&.id
    #   entity_page.save
    # end
    
    #redirect_to module_entity_pages_path, notice: "Entity Page was created successfully"
  end

  def edit
  end

  def update
    if @module_entity_page.update(module_entity_page_params)
      redirect_to module_entity_pages_path, notice: "ModuleEntityPage was updated successfully"
    else
      render :edit
    end
    # byebug
    # module_page_ids = params[:module_entity_page][:module_page_ids].reject!(&:blank?)
    # module_page_ids.each do |mp|
    #   byebug
    #   module_page = ModulePage.find(mp.to_i)
    #   if module_page.module_entity_pages.where(id: params[:id]).present?
      
    #   end
    #   entity_page = module_page.build_module_entity_pages(module_entity_page_params)
    #   entity_page.save
    # end
    # redirect_to module_entity_pages_path, notice: "Entity Page was updated successfully"
    
  end

  def destroy
    @module_entity_page.destroy
    redirect_to module_entity_pages_path, notice: "Entity Page was deleted"
  end

  private

  def module_entity_page_params
    params.require(:module_entity_page).permit(:module_page_id, :module_entity_page_name, :source_url, :page_avatar, :page_type, module_composition_details_attributes:[:id, :ui_element_id, :_destroy])
  end

  def set_module_entity_page
    @module_entity_page = ModuleEntityPage.find(params[:id])
  end
end
