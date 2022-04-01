class CreateModuleTcs < ActiveRecord::Migration[6.1]
  def change
    create_table :module_tcs do |t|
      t.string :file_avatar
      t.string :name
      t.string :source_url
      t.string :source_type
      t.references :module_page
      t.timestamps
    end
  end
end
