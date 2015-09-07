class AddAttachmentImageBannerToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :image_banner
    end
  end

  def self.down
    remove_attachment :places, :image_banner
  end
end
