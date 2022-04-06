class CreateHmSubfunctions < ActiveRecord::Migration[7.0]
  def change
    create_table :hm_subfunctions do |t|
      t.references :hive_module
      t.references :hive_module_subfunction
      t.timestamps
    end
  end
end
