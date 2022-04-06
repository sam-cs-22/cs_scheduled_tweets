class SubfunctionPage < ApplicationRecord
  belongs_to :hive_module_subfunction, optional: true
  belongs_to :module_page, optional: true
  accepts_nested_attributes_for :module_page
  accepts_nested_attributes_for :hive_module_subfunction
end
