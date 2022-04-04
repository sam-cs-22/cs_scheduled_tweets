class AddAppTypeToModulePageTable < ActiveRecord::Migration[6.1]
  def change
    add_column :module_pages, :app_type, :integer, after: :page_type
  end
end
