class ModuleEntityPageDetail < ApplicationRecord
  belongs_to :parent_page, class_name: 'ModulePage', foreign_key: :parent_page_id, optional: true
  belongs_to :child_page, class_name: 'ModulePage', foreign_key: :child_page_id, optional: true
end
