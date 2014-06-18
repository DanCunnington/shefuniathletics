class CreateNewAthletes < ActiveRecord::Migration
  def change
    create_table :new_athletes do |t|

      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
