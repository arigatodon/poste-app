class Post < ActiveRecord::Base
	has_many :comments ,dependent: :destroy
	mount_uploader :image, ImageUploader
	
	reverse_geocoded_by :latitude, :longitude
	geocoded_by :address
    after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
    after_validation :reverse_geocode
end
