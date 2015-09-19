class AddTaglineToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :tagline, :text
  end
end
