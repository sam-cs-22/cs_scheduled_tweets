class UiElementCategory < ApplicationRecord
  has_many :ui_elements
  validates :category_name, presence: true
end
