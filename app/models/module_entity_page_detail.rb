class ModuleEntityPageDetail < ApplicationRecord
  belongs_to :module_page, optional: true
  belongs_to :module_entity_page, optional: true
end
