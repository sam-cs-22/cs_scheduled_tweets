class CreateHiveModuleSubfunctions < ActiveRecord::Migration[7.0]
  def change
    create_table :hive_module_subfunctions do |t|
      t.string :name
      t.string :note
      t.references :hive_module
      t.timestamps
    end
  end
end
