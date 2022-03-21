class CreateModuleEntityPageDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :module_entity_page_details do |t|
      t.references :module_page
      t.references :module_entity_page
      t.timestamps
    end
  end
end
