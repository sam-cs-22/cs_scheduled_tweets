class CreateUiElements < ActiveRecord::Migration[6.1]
  def change
    create_table :ui_elements do |t|
      t.string :element_name
      t.text :element_discription
      t.string :element_avatar
      t.string :usage_details
      t.references :ui_element_category
      t.timestamps
    end
  end
end
