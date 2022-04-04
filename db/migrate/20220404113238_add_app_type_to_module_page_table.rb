class AddAppTypeToModulePageTable < ActiveRecord::Migration[6.1]
  def change
    add_column :module_pages, :app_type, :integer, default: 0, after: :page_type
    add_column :module_pages, :notes, :string, after: :app_type
    add_column :module_pages, :sort, :integer, after: :notes
  end
end
