class HiveModuleSubfunctionsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_hive_module_subfunction, only: [:show, :edit, :update, :destroy, :add_fas, :add_tcs]

  def index
    @q = HiveModuleSubfunction.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @hive_module_subfunctions = @q.result(distinct: true).page(params[:page])
  end

  def update
    if @hive_module_subfunction.update(hive_module_params)   
      redirect_to hive_modules_path, notice: "HiveModuleSubfunction was updated successfully"
    else
      render :edit
    end
  end

  def save_pages
    @hive_module_function = HiveModuleSubfunction.find(params[:hive_module_subfunction][:hive_module_subfunction_id])
    @entity_page_ids = params[:hive_module_subfunction][:module_page_ids].reject { |c| c.empty? }
    @hive_module_function.module_pages.destroy_all
    if !@entity_page_ids.empty?
      @hive_module_function.module_pages << ModulePage.where('id IN (?)', @entity_page_ids)
      redirect_to hive_module_path(@hive_module_function&.hive_module), notice: "Pages added successfully"
    end 
  end

  private

  def hive_module_params
    params.require(:hive_module_subfunction).permit(:name, :note, module_page_attributes:[:id, :name, :note, :_destroy])
  end

  def set_hive_module_subfunction
    @hive_module_subfunction = HiveModuleSubfunction.find(params[:id])
  end
end
