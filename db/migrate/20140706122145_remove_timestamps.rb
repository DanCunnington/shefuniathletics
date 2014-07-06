class RemoveTimestamps < ActiveRecord::Migration
  def change
  	remove_column :events, :created_at
  	remove_column :events, :updated_at
  	remove_column :event_types, :created_at
  	remove_column :event_types, :updated_at

  end
end
