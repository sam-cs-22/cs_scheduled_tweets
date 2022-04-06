class ModulePage < ApplicationRecord
  mount_uploader :page_avatar, PageAvatarUploader
  has_many :module_composition_details
  # has_many :module_entity_page_details
# has_many :module_entity_pages, through: :module_entity_page_details
  has_many :ui_elements, through: :module_composition_details
  accepts_nested_attributes_for :module_composition_details, reject_if: :all_blank, allow_destroy: true
  has_many :module_entity_page_details, class_name: "ModuleEntityPageDetail", foreign_key: 'child_page_id'
  has_many :module_entity_page_details, class_name: "ModuleEntityPageDetail", foreign_key: 'parent_page_id'
  has_many :parent_pages, through: :module_entity_page_details, class_name: 'ModulePage', foreign_key: 'parent_page_id' 
  has_many :child_pages, through: :module_entity_page_details, class_name: 'ModulePage', foreign_key: 'child_page_id'
  has_many :hive_module_subfunctions, through: :subfunction_pages
  has_many :subfunction_pages
  enum page_type: {
    entity_list: 0,
    entity_detail: 1,
    layout: 2, 
    modal: 3,
    dropdown: 4
  }, _prefix: true
  enum app_type: {
    fms: 0,
    up: 1,
    sc: 2
  }, _prefix: true
  validates :module_page_name, presence: true
  # validates :navigation_header, presence: true
  validates :source_url, presence: true
  validates :page_type, presence: true
  validates :page_avatar, presence: true
  self.per_page = 3
end
