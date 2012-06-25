class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy

  has_many :connections, foreign_key: "follower_id", class_name: "Connection", dependent: :destroy
  has_many :followeds, through: :connections

  has_many :reverse_connections, foreign_key: "followed_id", class_name: "Connection", dependent: :destroy
  has_many :followers, through: :reverse_connections, source: :follower

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :nickname, presence: true, uniqueness: true
  has_secure_password

  #attr_accessible :nickname, :email, :password, :password_confirmation, :nick_status
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def following?(other_user)
    connections.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    connections.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    connections.find_by_followed_id(other_user.id).destroy
  end

end
