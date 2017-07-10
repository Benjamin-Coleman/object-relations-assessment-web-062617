class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
  	@@all
  end

  def self.find_by_name(name)
  	@@all.detect{|customer| customer.full_name.downcase == name.downcase}
  end

  def self.find_all_by_first_name(name)
  	@@all.select{|customer| customer.first_name == name}
  end

  def self.all_names
  	@@all.map{|customer| customer.full_name}
  end

  def add_review(restaurant, content)
  	#if no restaurant object exists create it
  	#i'm assuming this method takes a string of the restaurant and not the restaurant object, 
  	# if you just want the object to the be the argument get rid of the find_by_name stuff and use restaurant arg
  	if !Restaurant.find_by_name(restaurant)
  		new_restaurant = Restaurant.new(restaurant)
	  	review = Review.new(content, self, new_restaurant)
	  	return review
	else
	 	#if it exists just add review
	 	review = Review.new(content, self, Restaurant.find_by_name(restaurant))
	 	review
	end
  end

end


# For our purposes, a Restaurant has many reviews, 
# a Customer has many reviews, and Restaurant - Customer is a many to many relationship.