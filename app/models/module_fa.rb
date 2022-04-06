class ModuleFa < ApplicationRecord
  enum source_type: {
    confluence: 0,
    onedrive: 1,
    googledrive: 2
  }, _prefix: true
  validates :name, presence: true
  validates :source_url, presence: true
end
