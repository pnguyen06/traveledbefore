class AddRegionToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :region, :string
  end
end
