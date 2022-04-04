class ModulePage < ApplicationRecord
  mount_uploader :page_avatar, PageAvatarUploader
  has_many :module_composition_details
  # has_many :module_entity_page_details
  # has_many :module_entity_pages, through: :module_entity_page_details
  has_many :ui_elements, through: :module_composition_details
  accepts_nested_attributes_for :module_composition_details, reject_if: :all_blank, allow_destroy: true
  has_many :module_fas
  accepts_nested_attributes_for :module_fas, allow_destroy: true
  has_many :module_tcs
  accepts_nested_attributes_for :module_tcs, allow_destroy: true
  has_many :module_entity_page_details, class_name: "ModuleEntityPageDetail", foreign_key: 'child_page_id'
  has_many :module_entity_page_details, class_name: "ModuleEntityPageDetail", foreign_key: 'parent_page_id'
  has_many :parent_pages, through: :module_entity_page_details, class_name: 'ModulePage', foreign_key: 'parent_page_id' 
  has_many :child_pages, through: :module_entity_page_details, class_name: 'ModulePage', foreign_key: 'child_page_id'
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
  # validates :module_composition_details, presence: true

  # validate :ui_elements_check,  on: :create

  # def ui_elements_check
  #   if params[:module_page][:ui_element_ids].blank?
  #     errors.add(:ui_elements, "can't be in the past")
  #   end
  # end

  
  
  
end
