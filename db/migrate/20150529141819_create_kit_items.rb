class CreateKitItems < ActiveRecord::Migration
  def change
    create_table :kit_items do |t|
      t.string :name
      t.string :image_url
      t.integer :priority
      t.timestamps
    end
  end
end
