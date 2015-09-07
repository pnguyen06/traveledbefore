	class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :places
  has_many :checks, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" }
 	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
