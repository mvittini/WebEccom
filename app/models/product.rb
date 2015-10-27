class Product < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :users 
	has_many :likes
	has_many :user_likes, through: :likes, source: :user 
	mount_uploader :picture, PictureUploader
end