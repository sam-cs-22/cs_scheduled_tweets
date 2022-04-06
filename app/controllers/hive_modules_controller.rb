class HiveModulesController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_hive_module, only: [:show, :edit, :update, :destroy, :add_fas, :add_tcs]

  def index
    @q = HiveModule.includes(:hive_module_subfunctions).ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @hive_modules = @q.result(distinct: true).page(params[:page])
  end

  def new
    @hive_module = HiveModule.new
    @hive_module.hive_module_subfunctions.build
  end

  def create
    @hive_module = HiveModule.new(hive_module_params)
    if @hive_module.save
      # @hive_module.ui_elements << UiElement.where("id IN (?)", submitted_element_ids)
      redirect_to hive_modules_path, notice: "HiveModule was created successfully"
    else
      render :new
    end
  end

  def edit; end

  def show
    @q = @hive_module.hive_module_subfunctions.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @hive_module_subfunctions = @q.result(distinct: true).page(params[:page])
  end

  def update
    if @hive_module.update(hive_module_params)   
      redirect_to hive_modules_path, notice: "HiveModule was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @hive_module.destroy
    redirect_to hive_modules_path, notice: "HiveModule was deleted"
  end

  def add_fas
    @hive_module.module_fas.build
  end

  def add_tcs
    @hive_module.module_fas.build
  end

  def save_fas
    @hive_module = HiveModule.find(hive_module_fa_params[:id])
    if @hive_module.update(hive_module_fa_params)
      redirect_to hive_modules_path, notice: "Functional Artifact was added successfully"
    end
  end

  def save_tcs
    @hive_module = HiveModule.find(hive_module_tc_params[:id])
    if @hive_module.update(hive_module_tc_params)
      redirect_to hive_modules_path, notice: "Test case was added successfully"
    end
  end

  

  private

  def hive_module_params
    params.require(:hive_module).permit(:name, :note, hive_module_subfunctions_attributes:[:id, :name, :note, :_destroy])
  end

  def hive_module_fa_params
    params.require(:hive_module).permit(:id, module_fas_attributes:[:id, :name, :source_url, :_destroy])
  end

  def hive_module_tc_params
    params.require(:hive_module).permit(:id, module_tcs_attributes:[:id, :name, :source_url, :_destroy])
  end

  def set_hive_module
    @hive_module = HiveModule.find(params[:id])
  end
end
