class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader

  validates :image, presence: true
  # validates :text, presence: true
  # validates :text, presence: true, unless: :image?
end
