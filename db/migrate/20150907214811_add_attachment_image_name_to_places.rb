class AddAttachmentImageNameToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :image_name
    end
  end

  def self.down
    remove_attachment :places, :image_name
  end
end
