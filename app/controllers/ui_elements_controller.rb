class UiElementsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_ui_element, only: [:show, :edit, :update, :destroy]

  def index
    @ui_elements = UiElement.all.order('created_at ASC')
  end

  def new
    @ui_element = UiElement.new
  end

  def create
    @ui_element = UiElement.new(ui_element_params)
    if @ui_element.save
      redirect_to ui_elements_path, notice: "UiElement was created successfully"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @ui_element.update(ui_element_params)
      redirect_to ui_elements_path, notice: "UiElement was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @ui_element.destroy
    redirect_to ui_elements_path, notice: "UiElement was deleted"
  end

  private

  def ui_element_params
    params.require(:ui_element).permit(:ui_element_category_id, :element_name, :element_discription, :element_avatar)
  end

  def set_ui_element
    @ui_element = UiElement.find(params[:id])
  end
end
