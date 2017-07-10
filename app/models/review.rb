class Review

	attr_accessor :customer, :restaurant
	attr_reader :content

	@@all = []

	def initialize(content, customer, restaurant)
		@content = content
		@@all << self
		@customer = customer
		@restaurant = restaurant
	end

	def self.all
		@@all
	end

	def customer
		@customer
	end	

	def restaurant
		@restaurant
	end
  
end

