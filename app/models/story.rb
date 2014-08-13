class Story < ActiveRecord::Base

	# template for building Story instances
	validates_format_of :url, with: URI.regexp

	validates :url, presence: true, uniqueness: true

	validates :title, presence: true, uniqueness: true

	validates :description, length: { maximum: 150, minimum: 20 }

	has_many :comments
	has_many :votes

end
