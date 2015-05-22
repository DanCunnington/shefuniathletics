class CreateCommitteePositions < ActiveRecord::Migration
  def change
    create_table :committee_positions do |t|
      t.string :position
      t.string :name
      t.string :image_url
      t.string :string
      t.integer :order
      t.text :description

      t.timestamps
    end
  end
end
