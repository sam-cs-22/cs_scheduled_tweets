class AddParentPageIdAndChildPageIdColumnsToModuleEntityPageDetailsTable < ActiveRecord::Migration[6.1]
  def change
     add_column :module_entity_page_details, :parent_page_id, :integer, after: :id
     add_column :module_entity_page_details, :child_page_id, :integer, after: :parent_page_id
     remove_column :module_entity_page_details, :module_page_id, :integer
     remove_column :module_entity_page_details, :module_entity_page_id, :integer
  end
end
