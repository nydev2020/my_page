class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, length: { maximum: 10 }
  
            # :password, length: { minimum: 7 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogs
  has_many :gallery
  has_many :comments
end
