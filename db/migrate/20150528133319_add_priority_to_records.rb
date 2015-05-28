class AddPriorityToRecords < ActiveRecord::Migration
  def change
    add_column :records, :priority, :integer
  end
end
