class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments

  has_one_attached :avatar

  validates :email, presence: true
  validates :unique_id, uniqueness: { case_sensitive: false }
end
