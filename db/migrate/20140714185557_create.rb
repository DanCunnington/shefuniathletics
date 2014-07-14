class Create < ActiveRecord::Migration
  def change
  	create_table :info_pages do |t|
      t.string :key
      t.text :value
     
     end
  end
end
