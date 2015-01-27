class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
    	t.string :shop_name
    	t.string :street_address
    	t.string :city
    	t.string :state
    	t.integer :zip_code

      t.timestamps null: false
    end
  end
end
