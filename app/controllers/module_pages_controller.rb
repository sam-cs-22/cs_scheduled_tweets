class ModulePagesController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_module_page, only: [:show, :edit, :update, :destroy, :add_fas, :add_tcs]
  before_action :parent_pages_tally, only: [:index, :sc_pages, :up_pages]

  def index
    @q = ModulePage.includes(:parent_pages, :child_pages, :ui_elements).app_type_fms.ransack(params[:q])
    @q.sorts = 'module_page_name desc' if @q.sorts.empty?
    @module_pages = @q.result(distinct: true).page(params[:page])
  end

  def sc_pages
    @q = ModulePage.includes(:parent_pages, :child_pages, :ui_elements).app_type_sc.ransack(params[:q])
    @q.sorts = 'module_page_name desc' if @q.sorts.empty?
    @module_pages = @q.result(distinct: true).page(params[:page])
  end

  def up_pages
    @q = ModulePage.includes(:parent_pages, :child_pages, :ui_elements).app_type_up.ransack(params[:q])
    @q.sorts = 'module_page_name desc' if @q.sorts.empty?
    @module_pages = @q.result(distinct: true).page(params[:page])
  end

  def new
    @module_page = ModulePage.new
    @module_page.module_composition_details.build
    @ui_elements = UiElement.all
    # @ui_elements.size.times { @module_page.module_composition_details.build }
  end

  def create
    @module_page = ModulePage.new(module_page_params)
    submitted_element_ids = params[:module_page][:ui_element_ids].reject { |c| c.empty? }
    if @module_page.save
      @module_page.ui_elements << UiElement.where("id IN (?)", submitted_element_ids)
      redirect_to module_pages_path, notice: "Page was created successfully"
    else
      render :new
    end
    
    
  end

  def edit; end

  def show; end

  def update
    if @module_page.update(module_page_params)
      @module_page.ui_elements.destroy_all
      # existing_element_ids = @module_page.ui_elements.pluck(&:id)
      submitted_element_ids = params[:module_page][:ui_element_ids].reject { |c| c.empty? }
      # common_elements = existing_element_ids & submitted_element_ids
      # @module_page.ui_elements.where("id IN (?)", common_elements)
      # final_element_ids = submitted_element_ids - existing_element_ids
      # @ui_elements = UiElement.find(final_element_ids)
      @module_page.ui_elements << UiElement.where("id IN (?)", submitted_element_ids)      
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
    module_pages_list = ModulePage.all.pluck(:id) - [@module_page.id]
    @all_module_pages = ModulePage.where('id IN (?)', module_pages_list)
  end

  def save_cloned_ae
    @module_page = ModulePage.find(params[:module_page][:module_page_id])
    entity_page_ids = params[:module_page][:child_page_ids].reject { |c| c.empty? }
    @module_page.child_pages.destroy_all
    if !entity_page_ids.empty?
      @module_page.child_pages << ModulePage.where('id IN (?)', entity_page_ids)
      redirect_to module_pages_path, notice: "Entity pages added"
    else 
      redirect_to module_pages_path, notice: "Something went wrong"
    end 
  end

  def add_fas
    @module_page.module_fas.build
  end

  def add_tcs
    @module_page.module_fas.build
  end

  def save_fas
    @module_page = ModulePage.find(module_page_fa_params[:id])
    if @module_page.update(module_page_fa_params)
      redirect_to module_pages_path, notice: "Functional Artifact was added successfully"
    end
  end

  def save_tcs
    @module_page = ModulePage.find(module_page_tc_params[:id])
    if @module_page.update(module_page_tc_params)
      redirect_to module_pages_path, notice: "Test case was added successfully"
    end
  end

  private

  def module_page_params
    params.require(:module_page).permit(:module_page_name, :navigation_header, :source_url, :page_avatar, :page_type, :ui_element_ids, :app_type, :notes, module_composition_details_attributes:[:id, :ui_element_id, :_destroy])
  end

  def module_entity_page_detail_params
    params.require(:module_page).permit(:module_page_id, :module_entity_page_id)
  end

  def module_page_fa_params
    params.require(:module_page).permit(:id, module_fas_attributes:[:id, :name, :source_url, :_destroy])
  end

  def module_page_tc_params
    params.require(:module_page).permit(:id, module_tcs_attributes:[:id, :name, :source_url, :_destroy])
  end

  def set_module_page
    @module_page = ModulePage.find(params[:id])
  end

  def parent_pages_tally
    @all_child_pages = ModuleEntityPageDetail.all.pluck(:child_page_id).tally
  end
end
