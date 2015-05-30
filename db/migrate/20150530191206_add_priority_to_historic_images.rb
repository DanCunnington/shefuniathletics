class AddPriorityToHistoricImages < ActiveRecord::Migration
  def change
    add_column :historic_images, :priority, :integer
  end
end
