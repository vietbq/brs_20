class Request < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}
  
  belongs_to :user

  scope :load_requests, -> {where(status: false).order created_at: :desc}
end
