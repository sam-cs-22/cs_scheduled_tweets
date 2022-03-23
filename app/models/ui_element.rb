class UiElement < ApplicationRecord
   mount_uploader :element_avatar, ElementAvatarUploader
   has_many :module_composition_details
   has_many :module_pages, through: :module_composition_details
   has_many :module_entity_pages, through: :module_composition_details
   belongs_to :ui_element_category
   validates :element_name, presence: true
   validates :element_discription, presence: true
   validates :usage_details, presence: true
   validates :ui_element_category, presence: true
   validates :element_avatar, presence: true
end
