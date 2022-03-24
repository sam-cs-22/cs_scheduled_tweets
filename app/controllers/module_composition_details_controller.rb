class ModuleCompositionDetailsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :module_composition_detail, only: [:show, :edit, :update, :destroy]

  def index
    @module_composition_details = ModuleCompositionDetail.all
  end

  def new
    @module_composition_detail = ModuleCompositionDetail.new
  end

  def create
    @module_composition_detail = ModuleCompositionDetail.new(module_composition_detail_params)
    if @module_composition_detail.save
      redirect_to module_composition_details_path, notice: "ModuleCompositionDetail was scheduled successfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @module_composition_detail.update(module_composition_detail_params)
      redirect_to module_composition_details_path, notice: "ModuleCompositionDetail was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @module_composition_detail.destroy
    redirect_to module_composition_details_path, notice: "ModuleCompositionDetail was unscheduled"
  end

  private

  def module_composition_detail_params
    params.require(:module_composition_detail).permit(:module_page_id, :module_entity_page_id, :ui_element_id)
  end

  def set_module_composition_detail
    @module_composition_detail = ModuleCompositionDetail.find(params[:id])
  end
end
