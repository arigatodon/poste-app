class Post < ActiveRecord::Base
	acts_as_votable
	
	has_many :comments ,dependent: :destroy
	has_many :favorite_posts
	has_many :user_favorites, through: :favorite_posts, :source => :user
	belongs_to :user
	belongs_to :category
	# has_many :post_categories, dependent: :destroy
 	# has_many :categories, through: :post_categories
 	 
	mount_uploader :image, ImageUploader
	
	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
	
    after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? }
    after_validation :reverse_geocode,   if: ->(obj){ (obj.latitude.present? && obj.longitude.present?) and (obj.latitude_changed? || obj.longitude_changed?) }
end

