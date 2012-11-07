class Visit < ActiveRecord::Base
  attr_accessible :date_visited, :spent, :store_id

  belongs_to :store 
end
