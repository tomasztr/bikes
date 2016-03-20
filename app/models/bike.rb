class Bike < ActiveRecord::Base
  has_many :users, through: :orders
  has_many :orders
  
  validates :brand, presence: true
  
  enum status: {
         available:       0,
         unavailable:    10,
       }

   enum size: {
          small:      0,
          
          normal:    10,
          large:     20,
        }
end


