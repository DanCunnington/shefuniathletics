class RemoveOrderFromCommitteePositions < ActiveRecord::Migration
  def change
  	remove_column :committee_positions, :order
  end
end
