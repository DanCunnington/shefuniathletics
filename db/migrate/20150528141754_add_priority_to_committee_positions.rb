class AddPriorityToCommitteePositions < ActiveRecord::Migration
  def change
    add_column :committee_positions, :priority, :integer
  end
end
