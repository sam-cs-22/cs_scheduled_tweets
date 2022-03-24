class CreateModuleEntityPages < ActiveRecord::Migration[6.1]
  def change
    create_table :module_entity_pages do |t|
      t.references :module_page
      t.string :module_entity_page_name
      t.integer :page_type
      t.string :page_avatar
      t.string :source_url
      t.timestamps
    end
  end
end