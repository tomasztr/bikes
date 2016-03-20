class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :bike

  validates :bike_id, :user_id, presence: true
end
