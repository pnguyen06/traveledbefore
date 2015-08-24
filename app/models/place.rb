class Place < ActiveRecord::Base
	belongs_to :user
	has_many :checks
end
