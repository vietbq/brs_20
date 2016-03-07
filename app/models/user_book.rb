class UserBook < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}
  
  belongs_to :user
  belongs_to :book

  scope :load_user_books, -> status{where(status: status).order created_at: :desc}
end
