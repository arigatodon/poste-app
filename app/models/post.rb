class Post < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments ,dependent: :destroy
	has_many :favorite_posts
	has_many :favorited_by, through: :favorite_posts, source: :user
	mount_uploader :image, ImageUploader
	
	reverse_geocoded_by :latitude, :longitude
	geocoded_by :address
    after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
    after_validation :reverse_geocode
end

