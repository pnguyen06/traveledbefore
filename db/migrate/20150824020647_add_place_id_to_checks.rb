class AddPlaceIdToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :place_id, :integer
    add_index :checks, :place_id
  end
end
