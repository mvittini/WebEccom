class User < ActiveRecord::Base

  
  before_save :default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :review, dependent: :destroy
  has_many :product
  has_many :likes
  has_many :product_likes, through: :likes, source: :product  
  validates :name, presence: true
  validates :lastname, presence: true
  validates :username, uniqueness: { case_sensitive: false }

  enum role: [:admin, :client, :guest]
  
  def default_role
    self.role ||= 1
  end
end
