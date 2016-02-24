class Book < ActiveRecord::Base
  belongs_to :category

  has_many :user_books
  has_many :reviews
  has_many :favorites

  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 10}
  validates :author, presence: true
  validates :number_of_pages, numericality: {only_integer: true}
end
