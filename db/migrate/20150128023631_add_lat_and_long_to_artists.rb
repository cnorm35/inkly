class AddLatAndLongToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :latitude, :float
    add_column :artists, :longitude, :float
  end
end
