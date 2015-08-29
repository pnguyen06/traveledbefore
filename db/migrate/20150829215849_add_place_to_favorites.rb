class AddPlaceToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :place1, :string
    add_column :favorites, :place2, :string
    add_column :favorites, :place3, :string
  end
end
