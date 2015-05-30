class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.integer :priority

      t.timestamps
    end
  end
end
