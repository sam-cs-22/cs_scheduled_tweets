module ApplicationHelper
  def button_label(object)
    object.new_record? ? "Create" : "Update"
  end
end
