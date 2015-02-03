class User < ActiveRecord::Base
    has_secure_password
	
	validates_uniqueness_of :name
	validates_uniqueness_of :email
	
     mount_uploader :photo, PhotoUploader
	 has_many :posts
end
