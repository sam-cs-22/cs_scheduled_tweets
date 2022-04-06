class AddNoteColumnAndModuleIdColumnToFasAndTcs < ActiveRecord::Migration[7.0]
  def change
    add_column :module_fas, :hive_module_id, :integer, after: :module_page_id
    add_column :module_fas, :note, :string, after: :hive_module_id
    add_column :module_tcs, :hive_module_id, :integer, after: :module_page_id
    add_column :module_tcs, :note, :string, after: :hive_module_id
    remove_column :module_fas, :module_page_id, :integer
    remove_column :module_tcs, :module_page_id, :integer
  end
end
