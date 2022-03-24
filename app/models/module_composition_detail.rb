class ModuleCompositionDetail < ApplicationRecord
  belongs_to :module_page, optional: true
  belongs_to :module_entity_page, optional: true
  belongs_to :ui_element, optional: true
  # validates_presence_of :module_page
  # validates_presence_of :module_entity_page
  validates_presence_of :ui_element
  accepts_nested_attributes_for :module_page
  accepts_nested_attributes_for :module_entity_page
end
