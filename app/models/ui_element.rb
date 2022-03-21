class UiElement < ApplicationRecord
   mount_uploader :element_avatar, ElementAvatarUploader
   has_many :module_composition_details
   has_many :module_pages, through: :module_composition_details
   has_many :module_entity_pages, through: :module_composition_details
   belongs_to :ui_element_category
end
