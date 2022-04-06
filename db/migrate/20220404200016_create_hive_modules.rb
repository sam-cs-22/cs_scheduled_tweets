class CreateHiveModules < ActiveRecord::Migration[7.0]
  def change
    create_table :hive_modules do |t|
      t.string :name
      t.string :default_landing_page
      t.string :note
      t.timestamps
    end
  end
end
