class Book < ActiveRecord::Base
  belongs_to :category

  has_many :user_books
  has_many :reviews
  has_many :favorites

  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 10}
  validates :author, presence: true
  validates :number_of_pages, numericality: {only_integer: true}

  enum status: [:reading, :read]

  class << self
    def ransackable_attributes auth_object = nil
      super & ["title", "author"]
    end
  end

  def marked_reading? current_user
    user_books.find_by user: current_user, status: 0
  end

  def marked_read? current_user
    user_books.find_by user: current_user, status: 1
  end

  def marked_favorite? current_user
    favorites.find_by user: current_user
  end

  def destroy_marked_book current_user
    user_books.find_by(user: current_user).destroy
  end

  def load_marked_book current_user
    user_books.find_by user: current_user
  end

  def load_marked_favorite current_user
    favorites.find_by user: current_user
  end
end
