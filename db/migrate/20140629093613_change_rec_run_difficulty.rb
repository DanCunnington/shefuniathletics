class ChangeRecRunDifficulty < ActiveRecord::Migration
  def change
  	remove_column :rec_run_routes, :difficulty
  	add_column :rec_run_routes, :difficulty, :string
  end
end
