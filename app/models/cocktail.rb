class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  mount_uploader :photo, PhotoUploader

  validates :name, uniqueness: true, presence: true
end
