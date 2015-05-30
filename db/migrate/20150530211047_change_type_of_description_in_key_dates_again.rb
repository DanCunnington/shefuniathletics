class ChangeTypeOfDescriptionInKeyDatesAgain < ActiveRecord::Migration
  def change
  	remove_column :key_dates, :description
  	add_column :key_dates, :description, :text
  end
end
