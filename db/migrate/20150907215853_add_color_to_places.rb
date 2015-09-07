class AddColorToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :bgcolor, :string
    add_column :places, :textcolor, :string
  end
end
