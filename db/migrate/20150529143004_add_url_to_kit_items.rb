class AddUrlToKitItems < ActiveRecord::Migration
  def change
    add_column :kit_items, :url, :string
  end
end
