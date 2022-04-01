class ModulePage < ApplicationRecord
  mount_uploader :page_avatar, PageAvatarUploader
  has_many :module_composition_details
  has_many :module_entity_page_details
  has_many :module_entity_pages, through: :module_entity_page_details
  has_many :ui_elements, through: :module_composition_details
  accepts_nested_attributes_for :module_composition_details, reject_if: :all_blank, allow_destroy: true
  has_many :module_fas
  accepts_nested_attributes_for :module_fas, allow_destroy: true
  has_many :module_tcs
  accepts_nested_attributes_for :module_tcs, allow_destroy: true
  enum page_type: {
    page: 0,
    modal: 1,
    popup: 2
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
