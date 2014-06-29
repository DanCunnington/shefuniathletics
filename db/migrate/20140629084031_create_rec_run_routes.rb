class CreateRecRunRoutes < ActiveRecord::Migration
  def change
    create_table :rec_run_routes do |t|
      t.string :name
      t.integer :distance
      t.integer :difficulty
      t.text :description
      t.text :google_maps_link
      t.timestamps
    end

    create_table :difficulties do |t|
      t.string :grade
    end
  end
end
