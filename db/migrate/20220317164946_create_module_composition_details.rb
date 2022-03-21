class CreateModuleCompositionDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :module_composition_details do |t|
      t.references :module_page
      t.references :module_entity_page
      t.references :ui_element
      t.timestamps
    end
  end
end
