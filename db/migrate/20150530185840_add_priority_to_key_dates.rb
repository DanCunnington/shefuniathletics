class AddPriorityToKeyDates < ActiveRecord::Migration
  def change
    add_column :key_dates, :priority, :integer
  end
end
