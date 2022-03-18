class CreateModulePages < ActiveRecord::Migration[6.1]
  def change
    create_table :module_pages do |t|
      t.string :module_page_name
      t.boolean :navigation_header
      t.string :source_url
      t.integer :page_type
      t.string :page_avatar
      t.timestamps
    end
  end
end
