class Category < ActiveRecord::Base
    has_many :rental_categories
    has_many :rentals, dependent: :destroy, through: :rental_categories
    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {minimum:3, maximum:20}
    validates_uniqueness_of :name
       
end
