class Rental < ActiveRecord::Base
    belongs_to :user
    has_many :rentals
    has_many :rental_categories
    has_many :categories, through: :rental_categories
    validates :title, presence: true, length: {minimum:3, maximum:50}
    validates :description, presence: true, length: {minimum: 10, maximum: 10000}
    validates :user_id, presence: true
    
    def self.search_by(search_term)
        where("LOWER(title) LIKE :search_term", 
        search_term: "%#{search_term}")
    end
        
end
