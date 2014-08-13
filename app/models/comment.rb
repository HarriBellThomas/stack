class Comment < ActiveRecord::Base

	validates :body, presence: true, length: { minimum: 5, maximum: 50 }
	belongs_to :story

end
