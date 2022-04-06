class CreateSubfunctionPages < ActiveRecord::Migration[7.0]
  def change
    create_table :subfunction_pages do |t|
      t.references :hive_module_subfunction
      t.references :module_page
      t.timestamps
    end
  end
end
