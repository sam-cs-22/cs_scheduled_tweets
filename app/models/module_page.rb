class ModulePage < ApplicationRecord
  mount_uploader :page_avatar, PageAvatarUploader
  has_many :module_entity_pages
  has_many :module_composition_details
  has_many :ui_elements, through: :module_composition_details
  accepts_nested_attributes_for :module_composition_details, reject_if: :all_blank, allow_destroy: true
  enum page_type: {
    page: 0,
    modal: 1,
    popup: 2
  }, _prefix: true
end
