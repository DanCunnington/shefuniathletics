class CreateHistoricImages < ActiveRecord::Migration
  def change
    create_table :historic_images do |t|
      t.string :image_url

      t.timestamps
    end
  end
end
