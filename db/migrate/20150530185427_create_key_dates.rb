class CreateKeyDates < ActiveRecord::Migration
  def change
    create_table :key_dates do |t|
      t.string :description

      t.timestamps
    end
  end
end
