class Ingredient < ActiveRecord::Base
  has_many :doses
  has_many :cocktails, through: :doses, dependent: :restrict_with_exception

  validates :name, uniqueness: true, presence: true

  #before_destroy :check_if_cocktails

  # def check_if_cocktails
  #   if cocktails.any?
  #     errors.add("You can't destroy this ingredient whilst it's used by a cocktail.")
  #     return false
  #   end
  # end
end
