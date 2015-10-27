class Product < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	mount_uploader :picture, PictureUploader
end