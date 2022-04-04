module ApplicationHelper
  def button_label(object)
    object.new_record? ? "Create" : "Update"
  end

  def page_group_active_tab(action_name)
    groups = ModulePage.app_types.keys
    groups.include?(action_name) ? 'active' : ''
  end
end
