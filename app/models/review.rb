class Review < ActiveRecord::Base
		

	belongs_to :restaurant
	# validates :name, presence: true 
	# validates :content, presence: true, length: { minimum: 5 }
	validates :rating, inclusion: { in: :valid_ratings.to_proc, message: 'must be selected' }



	def valid_ratings
		if restaurant.promoted?
			return 1..5
		end
		1..4
	end
end