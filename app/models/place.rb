class Place < ActiveRecord::Base
	belongs_to :user
	has_many :checks

	scope :by_region, -> region { where(:region => region) }

	has_attached_file :image_name, :styles => { }
	validates_attachment_content_type :image_name, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_attached_file :image_banner, :styles => { }
	validates_attachment_content_type :image_banner, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
