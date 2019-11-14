class User < ApplicationRecord
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
    # REGEX = Regular Expression
    #To validate correct email structure
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 50 },
  format: { with: EMAIL_REGEX },
  uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: {minimum: 6},allow_nil: true

  ##following function
  has_many :active_relationships, class_name: "Relationship",
                                          foreign_key: "follower_id",
                                          dependent: :destroy
  ##follower function
  has_many :passive_relationships, class_name: "Relationship",
                                          foreign_key: "followed_id",
                                          dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  ##follow other user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  ##Unfollow a other user
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  ##Returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end
end
