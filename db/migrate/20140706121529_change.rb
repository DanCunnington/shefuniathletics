class Change < ActiveRecord::Migration
  def change
  	remove_column :records, :type
  	add_column :records, :event_type, :string
  end
end
