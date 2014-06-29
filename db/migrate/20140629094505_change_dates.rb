class ChangeDates < ActiveRecord::Migration
  def change
  	remove_column :fixtures, :date
  	add_column :fixtures, :date, :date

  	remove_column :socials, :date
  	add_column :socials, :date, :date
  end
end
