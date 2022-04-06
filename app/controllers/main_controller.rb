class MainController < ApplicationController
  def index
  end

  def search
    if params[:search].blank? 
      redirect_to module_pages_path and return
    else
      @parameter = params[:search].downcase
      @hive_modules = HiveModule.where("lower(name) LIKE ?", "%#{@parameter}%")
      @ui_elements = UiElement.where("lower(element_name) LIKE ?", "%#{@parameter}%")
      @module_pages = ModulePage.where("lower(module_page_name) LIKE ?", "%#{@parameter}%")
      # @module_entity_pages = ModuleEntityPage.where("lower(module_entity_page_name) LIKE ?", "%#{@parameter}%")
    end
  end
end