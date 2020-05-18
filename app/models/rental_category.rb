class RentalCategory < ActiveRecord::Base
   belongs_to :rental
   belongs_to :category    
end