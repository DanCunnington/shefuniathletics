class CreateFixtures < ActiveRecord::Migration
  def change
    create_table :fixtures do |t|
      t.string :name
      t.string :date
      t.string :location
      t.string :result_link

      t.timestamps
    end
  end
end
