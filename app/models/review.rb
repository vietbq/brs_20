class Review < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}
  
  belongs_to :user
  belongs_to :book
  
  has_many :comments
  scope :order_reviews, ->{order created_at: :DESC}
end
