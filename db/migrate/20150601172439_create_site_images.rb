class CreateSiteImages < ActiveRecord::Migration
  def change
    create_table :site_images do |t|
      t.string :reference
      t.string :image_url

      t.timestamps
    end
  end
end
