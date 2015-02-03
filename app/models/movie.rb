class Movie < ActiveRecord::Base
    belongs_to :genre
	has_many :posts
	
	validates :title, presence: true
end
