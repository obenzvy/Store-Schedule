class Store < ActiveRecord::Base
  attr_accessible :address, :city, :state, :store, :zipcode, :latitude, :longitude

  geocoded_by :complete_address
  after_validation :geocode
  has_many :visits
  acts_as_gmappable

  def gmaps4rails_address
	"#{self.address}, #{self.city}, #{self.state}, #{self.zipcode}" 
  end

  def gmaps4rails_infowindow
     "#{self.store} - #{self.address}
     <br>Last Visit:#{self.store_visit_date} 
     </br>Amount Spent: $#{self.store_visit_spend}"
  end

  def gmaps4rails_marker_picture
 	{
 	"picture" => "/assets/#{self.store}.png",          # string,  mandatory
  	"width" =>  32,          # integer, mandatory
	"height" => 32,         # integer, mandatory
	}
end

  def complete_address
  	"#{self.address}, #{self.city}, #{self.state}, #{self.zipcode}"
  end

  def store_name
  	"#{self.store} - #{self.address}"
  end

  def store_visit_date
  	if self.visits.count == 0
  		"NA"
  	else
  		self.visits.last.date_visited
  	end
  end

  def store_visit_spend
  	if self.visits.count == 0
  		"NA"
  	else
  		self.visits.last.spent
  	end
  end

end

