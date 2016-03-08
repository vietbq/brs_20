class User < ActiveRecord::Base
  acts_as_paranoid

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :trackable, :validatable

  enum role: [:admin, :user]

  has_many :user_books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower, dependent: :destroy
  
  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    following.include? other_user
  end
end
