class HiveModuleSubfunction < ApplicationRecord
  belongs_to :hive_module
  validates :name, presence: true
  has_many :subfunction_pages
  has_many :module_pages, through: :subfunction_pages
end
