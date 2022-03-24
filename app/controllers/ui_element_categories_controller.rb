class UiElementCategoriesController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_ui_element_category, only: [:show, :edit, :update, :destroy]

  def index
    @ui_element_categories = UiElementCategory.all
  end

  def new
    @ui_element_category = UiElementCategory.new
  end

  def create
    @ui_element_category = UiElementCategory.new(ui_element_params)
    if @ui_element_category.save
      redirect_to ui_element_categories_path, notice: "UiElementCategory was scheduled successfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @ui_element_category.update(ui_element_params)
      redirect_to ui_element_categories_path, notice: "UiElementCategory was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @ui_element_category.destroy
    redirect_to ui_element_categories_path, notice: "UiElementCategory was unscheduled"
  end

  private

  def ui_element_params
    params.require(:ui_element_category).permit(:category_name)
  end

  def set_ui_element_category
    @ui_element_category = UiElementCategory.find(params[:id])
  end
end
