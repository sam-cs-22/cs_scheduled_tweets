class HiveModule < ApplicationRecord
  has_many :hive_module_subfunctions, dependent: :destroy
  accepts_nested_attributes_for :hive_module_subfunctions, allow_destroy: true
  has_many :module_fas, dependent: :destroy
  accepts_nested_attributes_for :module_fas,  allow_destroy: true
  has_many :module_tcs, dependent: :destroy
  accepts_nested_attributes_for :module_tcs, allow_destroy: true
  validates :name, presence: true
end
