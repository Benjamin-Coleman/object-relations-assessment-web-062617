class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
  	@@all
  end

  def self.find_by_name(name)
  	@@all.detect {|restaurant| restaurant.name.downcase == name.downcase}
  end

  def reviews
  	Review.all.select{|review| review.restaurant == self}
  end

  def customers
  	reviews.map {|review| review.customer}
  end

end


# Restaurant.all
# returns an array of all restaurants
# Restaurant.find_by_name(name)
# given a string of restaurant name, returns the first restaurant that matches
# Restaurant#reviews
# returns an array of all reviews for that restaurant
# Restaurant#customers