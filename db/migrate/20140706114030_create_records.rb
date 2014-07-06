class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|

      t.string :event
      t.string :type
      t.string :athlete
      t.string :time
      t.string :competition

      t.timestamps
    end
  end
end
