class ChangeTables < ActiveRecord::Migration[6.1]
  def change
    add_column :books,:year,:integer
    add_column :students,:roll_no,:integer
    rename_column :students,:name,:student_name
    remove_timestamps :students
  end
end
