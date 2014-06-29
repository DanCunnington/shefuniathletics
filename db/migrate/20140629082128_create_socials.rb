class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :name
      t.string :date
      t.string :facebook_event_link
      t.timestamps
    end
  end
end
